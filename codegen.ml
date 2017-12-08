(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast

module StringMap = Map.Make(String)
module String = String


let translate (globals, functions) =
  let context = L.global_context () in
  let the_module = L.create_module context "Genesis"
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and i1_t   = L.i1_type   context
  and flt_t =  L.double_type context
  and pointer_t = L.pointer_type
  and void_t = L.void_type context
  and array_t = L.array_type in
  and color_t = L.named_struct_type context "color" in
    L.struct_set_body color_t [| i32_t ; i32_t ; i32_t |] false; (* need to change here if source file changes *)

  (*Go from a type in MicroC to a type in LLVM*)
  let rec ltype_of_typ = function
      A.Int -> i32_t
    | A.Float -> flt_t
    | A.String -> pointer_t i8_t
    | A.Bool -> i1_t
    | A.Void -> void_t 
    | A.Color -> color_t
    | A.ArrayType (typ, size) -> array_t (ltype_of_typ typ) size 

  in

  (* Method to build an array *)
  let rec build_uniform_array the_array the_llvm_value repeat_count =
    (match repeat_count with
      0 -> the_array (*base case*)
      |_ -> build_uniform_array (the_llvm_value::the_array) the_llvm_value (repeat_count-1))
    in

  (* Declare each global variable; remember its value in a map *)
(*   let global_vars =
    let global_var m (t, n) =
      let init = L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in
   *)
  (* Declare each global variable; remember its value in a map *)
  (* Define the starting values of global vars and init them to this, also store vars in the map *)
  let global_variables map (var_typ, name) =
    let global_value = (match var_typ with 
      A.int -> L.define_global name (L.const_int (ltype_of_typ A.int) 0) the_module
    | A.Bool -> L.define_global name (L.const_int (ltype_of_typ A.Bool) 0) the_module
    | A.Float -> 
    | A.ArrayType(typ, size) -> (* array starts full of nulls *)
      let element_val = L.const_null (ltype_of_typ typ) in
      let init = L.const_array (ltype_of_typ typ) 
      (Array.of_list (build_uniform_array [] element_val size)) in 
      StringMap.add name (L.define_global name init the_module) map in
    List.fold_left global_var StringMap.empty globals in
 
(*Why not use Hashtbl?*)


  (* Declare printf(), which the print built-in function will call *)
  let printf_t = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func = L.declare_function "printf" printf_t the_module in

  (* Declare the built-in printbig() function *)
  let printbig_t = L.function_type i32_t [| i32_t |] in
  let printbig_func = L.declare_function "printbig" printbig_t the_module in

  (* Define each function (arguments and return type) so we can call it *)
  let function_decls =
    let function_decl m fdecl =
      let name = fdecl.A.fname
      and formal_types =
  Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.A.formals)
      in let ftype = L.function_type (ltype_of_typ fdecl.A.typ) formal_types in
      StringMap.add name (L.define_function name ftype the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty functions in

  (* Cast int to float *)
  let make_float var builder = 
    if L.type_of var = flt_t then var else (L.build_sitofp var flt_t "tmp" builder) in

  (* Cast float to int, don't modify bools *)
  let make_int var builder =
    if L.type_of var = i32_t || L.type_of var = i1_t then var 
    else (L.build_fptosi var i32_t "tmp" builder) in
  
  (* Fill in the body of the given function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.A.fname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in
    let float_format_str = L.build_global_stringptr "%lf\n" "fmt" builder in
    let string_format_str = L.build_global_stringptr "%s\n" "fmt" builder in
    
    (* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)
(*     let local_vars =
      let add_formal m (t, n) p = L.set_value_name n p;
  let local = L.build_alloca (ltype_of_typ t) n builder in
  ignore (L.build_store p local builder);
  StringMap.add n local m in *)
    let local_vars =
      let add_formal m (t, n) p = L.set_value_name n p;
        match t with
            A.ArrayType(_,_) -> StringMap.add local_vars n p
          | _ -> let local = L.build_alloca (ltype_of_typ t) n builder in
          ignore (L.build_store p local builder);
          StringMap.add n local m
      in

      (*DIDNT add strings here*)
      let add_local m (t, n) =
  let local_var = L.build_alloca (ltype_of_typ t) n builder
  in StringMap.add n local_var m in

      let formals = List.fold_left2 add_formal StringMap.empty fdecl.A.formals
          (Array.to_list (L.params the_function)) in
      List.fold_left add_local formals fdecl.A.locals in

    (* Return the value for a variable or formal argument *)
    let lookup n = try StringMap.find n local_vars
                   with Not_found -> StringMap.find n global_vars
    in

    (* Construct code for an expression; return its value *)
    let rec expr builder = function
        A.Literal i -> L.const_int i32_t i
      | A.StringLit s -> L.build_global_stringptr s "tmp" builder
      | A.FloatLit fl -> L.const_float flt_t fl
      | A.BoolLit b -> L.const_int i1_t (if b then 1 else 0)
      | A.Noexpr -> L.const_int i32_t 0
      | A.Id s -> L.build_load (lookup s) s builder
      | A.Binop (e1, op, e2) ->
    let e1' = expr builder e1
    and e2' = expr builder e2 in
    if (L.type_of e1' = i32_t && L.type_of e2' = i32_t) then
      (match op with
          A.Add     -> L.build_add
        | A.Sub     -> L.build_sub
        | A.Mult    -> L.build_mul
        | A.Div     -> L.build_sdiv
        | A.And     -> L.build_and
        | A.Or      -> L.build_or
        | A.Equal   -> L.build_icmp L.Icmp.Eq
        | A.Neq     -> L.build_icmp L.Icmp.Ne
        | A.Less    -> L.build_icmp L.Icmp.Slt
        | A.Leq     -> L.build_icmp L.Icmp.Sle
        | A.Greater -> L.build_icmp L.Icmp.Sgt
        | A.Geq     -> L.build_icmp L.Icmp.Sge
      ) e1' e2' "tmp" builder
    else if (L.type_of e1' = flt_t || L.type_of e2' = flt_t) then
      (match op with
          A.Add     -> L.build_fadd
        | A.Sub     -> L.build_fsub
        | A.Mult    -> L.build_fmul
        | A.Div     -> L.build_fdiv
        | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
        | A.Neq     -> L.build_fcmp L.Fcmp.One
        | A.Less    -> L.build_fcmp L.Fcmp.Olt
        | A.Leq     -> L.build_fcmp L.Fcmp.Ole
        | A.Greater -> L.build_fcmp L.Fcmp.Ogt
        | A.Geq     -> L.build_fcmp L.Fcmp.Oge
        | _         -> raise (Failure ("incompatible operator-operand for number")) (* Should never be reached *)
      ) (make_float e1' builder) (make_float e2' builder) "tmp" builder
    else 
      (match op with
          A.And     -> L.build_and
        | A.Or      -> L.build_or
        | _         -> raise (Failure ("incompatible operator-operand")) (* Should never be reached *)
      ) e1' e2' "tmp" builder

    | A.Unop(op, e) ->
    let e' = expr builder e in

    (match op with
        A.Neg     -> L.build_neg
      | A.Not     -> L.build_not) e' "tmp" builder

      | A.Assign (s, e) -> let e' = expr builder e in
        if L.type_of (lookup s) = (L.pointer_type i32_t) then
          ignore (L.build_store (make_int e' builder) (lookup s) builder) (* Handle float to int downcast *)
        else if L.type_of (lookup s) = (L.pointer_type flt_t) then
          ignore (L.build_store (make_float e' builder) (lookup s) builder) (* Handle int to float upcast *)
        else
          ignore (L.build_store e' (lookup s) builder) (* Normal assignment for everything else *)
        ; e' (* Fixes bug in test-func2 *)

      | A.Call ("printfl", [e]) -> 
          L.build_call printf_func [| float_format_str ; make_float (expr builder e) builder |]
          "printf" builder 
      | A.Call ("print", [e]) | A.Call ("printb", [e]) ->
          L.build_call printf_func [| int_format_str ; make_int (expr builder e) builder |]
          "printf" builder
      | A.Call ("printbig", [e]) ->
          L.build_call printbig_func [| (expr builder e) |] "printbig" builder
      | A.Call ("prints", [e]) ->
          L.build_call printf_func [| string_format_str ; (expr builder e) |] "printf" builder
      | A.Call (f, act) ->
          let (fdef, fdecl) = StringMap.find f function_decls in
          let actuals = List.rev (List.map (expr builder) (List.rev act)) in
          let result = (match fdecl.A.typ with A.Void -> ""
        | _ -> f ^ "_result") in
          L.build_call fdef (Array.of_list actuals) result builder
    in

    (* Invoke "f builder" if the current block doesn't already
       have a terminal (e.g., a branch). *)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
  Some _ -> ()
      | None -> ignore (f builder) in
  
    (* Build the code for the given statement; return the builder for
       the statement's successor *)
    let rec stmt builder = function
  A.Block sl -> List.fold_left stmt builder sl
      | A.Expr e -> ignore (expr builder e); builder
      | A.Return e -> ignore (match fdecl.A.typ with
    A.Void -> L.build_ret_void builder
  | _ -> L.build_ret (expr builder e) builder); builder
      | A.If (predicate, then_stmt, else_stmt) ->
         let bool_val = expr builder predicate in
   let merge_bb = L.append_block context "merge" the_function in

   let then_bb = L.append_block context "then" the_function in
   add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
     (L.build_br merge_bb);

   let else_bb = L.append_block context "else" the_function in
   add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
     (L.build_br merge_bb);

   ignore (L.build_cond_br bool_val then_bb else_bb builder);
   L.builder_at_end context merge_bb

      | A.While (predicate, body) ->
    let pred_bb = L.append_block context "while" the_function in
    ignore (L.build_br pred_bb builder);

    let body_bb = L.append_block context "while_body" the_function in
    add_terminal (stmt (L.builder_at_end context body_bb) body)
      (L.build_br pred_bb);

    let pred_builder = L.builder_at_end context pred_bb in
    let bool_val = expr pred_builder predicate in

    let merge_bb = L.append_block context "merge" the_function in
    ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);
    L.builder_at_end context merge_bb

      | A.For (e1, e2, e3, body) -> stmt builder
      ( A.Block [A.Expr e1 ; A.While (e2, A.Block [body ; A.Expr e3]) ] )
    in

    (* Build the code for each statement in the function *)
    let builder = stmt builder (A.Block fdecl.A.body) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.A.typ with
        A.Void -> L.build_ret_void
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body functions;
  the_module
