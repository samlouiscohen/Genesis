(* Semantic checking for the MicroC compiler *)

open Ast

module StringMap = Map.Make(String)

(* Semantic checking of a program. Returns void if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (globals, functions) =

  (* Raise an exception if the given list has a duplicate *)
  let report_duplicate exceptf list =
    let rec helper = function
  n1 :: n2 :: _ when n1 = n2 -> raise (Failure (exceptf n1))
      | _ :: t -> helper t
      | [] -> ()
    in helper (List.sort compare list)
  in

  let isNum varType = if (varType = Int || varType = Float) then true else false in 

  (* Raise an exception if a given binding is to a void type *)
  let check_not_void exceptf = function
      (Void, n) -> raise (Failure (exceptf n))
    | _ -> ()
  in
  
  (* Raise an exception of the given rvalue type cannot be assigned to
     the given lvalue type. (int can be assigned to float and vice versa) *)
  let check_assign lValueType rValueType err =
    if ((isNum lValueType) && (isNum rValueType)) then lValueType
    else if lValueType == rValueType then lValueType else raise err
  in

  (*   let check_assign lvaluet rvaluet err =
     if lvaluet == rvaluet then lvaluet else raise err
  in *)

   
  (**** Checking Global Variables ****)

  List.iter (check_not_void (fun n -> "illegal void global " ^ n)) globals;
   
  report_duplicate (fun n -> "duplicate global " ^ n) (List.map snd globals);

  (**** Checking Functions ****)

  if List.mem "print" (List.map (fun fd -> fd.fname) functions)
  then raise (Failure ("function print may not be defined")) else ();

  report_duplicate (fun n -> "duplicate function " ^ n)
    (List.map (fun fd -> fd.fname) functions);

  (* Function declaration for a named function *)
  let built_in_decls =  StringMap.add "print"
     { typ = Void; fname = "print"; formals = [(Int, "x")];
       locals = []; body = [] } 
       
       (StringMap.add "printb"
     { typ = Void; fname = "printb"; formals = [(Bool, "x")];
       locals = []; body = [] } 

       (StringMap.add "printfl"
     { typ = Void; fname = "printfl"; formals = [(Float, "x")];
       locals = []; body = [] } 

       (StringMap.add "keyDown"
     { typ = Bool; fname = "keyDown"; formals = [(String, "keyName")];
       locals = []; body = [] } 
       
       (StringMap.add "keyUp"
     { typ = Bool; fname = "keyUp"; formals = [(String, "keyName")];
       locals = []; body = [] } 

       (StringMap.add "keyHeld"
     { typ = Bool; fname = "keyHeld"; formals = [(String, "keyName")];
       locals = []; body = [] } 

       (StringMap.add "initScreen"
     { typ = Int; fname = "initScreen"; formals = [(Int, "width"); (Int, "height"); (Color, "c")];
       locals = []; body = [] } 

       (StringMap.add "startGame"
     { typ = Void; fname = "startGame"; formals = [(Int, "width"); (Int, "height"); (Color, "c")];
       locals = []; body = [] } 

       (StringMap.add "prints"
     { typ = Void; fname = "prints"; formals = [(String, "x")];
       locals = []; body = [] }

       (StringMap.singleton "printbig"
     { typ = Void; fname = "printbig"; formals = [(Int, "x")];
       locals = []; body = [] })))))))))
   in

  let function_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m)
                         built_in_decls functions
  in

  let function_decl s = try StringMap.find s function_decls
       with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = function_decl "main" in (* Ensure "main" is defined *)

  let check_function func =

    List.iter (check_not_void (fun n -> "illegal void formal " ^ n ^
      " in " ^ func.fname)) func.formals;

    report_duplicate (fun n -> "duplicate formal " ^ n ^ " in " ^ func.fname)
      (List.map snd func.formals);

    List.iter (check_not_void (fun n -> "illegal void local " ^ n ^
      " in " ^ func.fname)) func.locals;

    report_duplicate (fun n -> "duplicate local " ^ n ^ " in " ^ func.fname)
      (List.map snd func.locals);

    (* Type of each variable (global, formal, or local *)
    let symbols = List.fold_left (fun m (t, n) -> StringMap.add n t m)
  StringMap.empty (globals @ func.formals @ func.locals )
    in

    let type_of_identifier s =
      try let id_typ = StringMap.find s symbols in 
          (match id_typ with
              ArrayType(t) -> t
            | _ -> id_typ
          )
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
(*
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
*)
    in

    (* Return the type of an expression or throw an exception *)
    let rec expr = function
        Literal _ -> Int
      | FloatLit _ -> Float
      | StringLit _ -> String
      | BoolLit _ -> Bool
      | ColorLit _ -> Color
      | Id s -> type_of_identifier s
      | ArrayAccess(s, _) -> type_of_identifier s
      | ArrayInit(_, _, _) -> raise (Failure ("Ya no you can't do that with arrays"))
      | ArrayAssign(_, _, _) -> raise (Failure ("Ya no you can't do that with arrays"))
      | Binop(e1, op, e2) as e -> let t1 = expr e1 and t2 = expr e2
    in 

    (match op with
        Add | Sub | Mult | Div when t1 = Int && t2 = Int -> Int
      | Add | Sub | Mult | Div when isNum t1 && isNum t2 -> Float
      | Equal | Neq when t1 = t2 -> Bool
      | Less | Leq | Greater | Geq when isNum t1 && isNum t2 -> Bool
      | And | Or when t1 = Bool && t2 = Bool -> Bool
      | _ -> raise (Failure ("illegal binary operator " ^
            string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
            string_of_typ t2 ^ " in " ^ string_of_expr e))
      )
      | Unop(op, e) as ex -> let t = expr e in
     (match op with
          Neg when t = Int -> Int
        | Neg when t = Float -> Float
        | Not when t = Bool -> Bool
        | _ -> raise (Failure ("illegal unary operator " ^ string_of_uop op ^
          string_of_typ t ^ " in " ^ string_of_expr ex)))
        | Noexpr -> Void
        | Assign(var, e) as ex -> let lt = type_of_identifier var
                                and rt = expr e in
        check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
             " = " ^ string_of_typ rt ^ " in " ^ 
             string_of_expr ex))
        | Call(fname, actuals) as call -> let fd = function_decl fname in
          if List.length actuals != List.length fd.formals then
            raise (Failure ("expecting " ^ string_of_int
              (List.length fd.formals) ^ " arguments in " ^ string_of_expr call))
          else
            List.iter2 (fun (ft, _) e -> let et = expr e in
               ignore (check_assign ft et
                 (Failure ("illegal actual argument found " ^ string_of_typ et ^
                 " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e))))
              fd.formals actuals;
            fd.typ
      in

    let check_bool_expr e = if expr e != Bool
     then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
     else () in

    (* Verify a statement or throw an exception *)
    let rec stmt = function
  Block sl -> let rec check_block = function
           [Return _ as s] -> stmt s
         | Return _ :: _ -> raise (Failure "nothing may follow a return")
         | Block sl :: ss -> check_block (sl @ ss)
         | s :: ss -> stmt s ; check_block ss
         | [] -> ()
        in check_block sl
      | Expr e -> ignore (expr e)
      | Return e -> let t = expr e in if t = func.typ then () else
         raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
                         string_of_typ func.typ ^ " in " ^ string_of_expr e))
           
      | If(p, b1, b2) -> check_bool_expr p; stmt b1; stmt b2
      | For(e1, e2, e3, st) -> ignore (expr e1); check_bool_expr e2;
                               ignore (expr e3); stmt st
      | While(p, s) -> check_bool_expr p; stmt s
    in

    stmt (Block func.body)
   
  in
  List.iter check_function functions
