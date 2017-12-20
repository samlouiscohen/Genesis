(* Semantic checking for the Genesis compiler 
  Authors: 
   - Michael Wang
   - Jason Zhao
   - Sam Cohen
   - Saahil Jain
*)

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
    else if lValueType = rValueType then lValueType else raise err
  in

  let check_assign_array lval rval err = 
    if lval = rval then lval else raise err
  in


  let is_array_num theType err = 
    if(isNum theType) then theType else raise err
  in

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

      (StringMap.add "quit"
     { typ = Void; fname = "quit"; formals = [];
       locals = []; body = [] } 

      (StringMap.add "setFPS"
     { typ = Void; fname = "setFPS"; formals = [(Int, "fps")];
       locals = []; body = [] }        

       (StringMap.add "delete"
     { typ = Void; fname = "delete"; formals = [(Cluster, "c")];
       locals = []; body = [] } 

       (StringMap.add "random"
     { typ = Int; fname = "random"; formals = [(Int, "max")];
       locals = []; body = [] }        

       (StringMap.add "prints"
     { typ = Void; fname = "prints"; formals = [(String, "x")];
       locals = []; body = [] }

       (StringMap.singleton "printbig"
     { typ = Void; fname = "printbig"; formals = [(Int, "x")];
       locals = []; body = [] })))))))))))))
   in

  (*Add the built-in functions to the function declaration list*)
  let function_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m)
                         built_in_decls functions
  in

  (*Grab the function declaration given its name*)
  let function_decl s = try StringMap.find s function_decls
       with Not_found -> raise (Failure ("Must define the function " ^ s))
  in
  
  let _ = function_decl "main" in (* Ensure "main" is defined *)

  let _ = function_decl "update" in (* Ensure "update" is defined *)

  let _ = function_decl "init" in (* Ensure "init" is defined *)

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
        id_typ
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let type_of_identifier_array s =
      try let id_typ = StringMap.find s symbols in 
        (match id_typ with
            ArrayType(t) -> t
          | _ -> id_typ
        )
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let verify_array s = 
      try let id_typ = StringMap.find s symbols in 
        (match id_typ with
            ArrayType(t) -> t
          | _ -> raise (Failure (s ^ " is not an array!  What are you doing??"))
        )
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let verify_array_init t = 
      (match t with
          Void -> raise (Failure ("The Lord does not allow void arrays..."))
        | _ -> t
      )
    in

    let type_of_property s =
      (match s with
        | "x" -> Int
        | "y" -> Int
        | "dx" -> Int
        | "dy" -> Int
        | "height" -> Int
        | "width" -> Int
        | "clr" -> Color 
        | "draw" -> Bool
        | _ -> raise (Failure ("property \'" ^ s ^ "\' is not defined"))
      )
    in

    (* Return the type of an expression or throw an exception *)
    let rec expr = function
        Literal _ -> Int
      | FloatLit _ -> Float
      | StringLit _ -> String
      | BoolLit _ -> Bool

      | ColorLit(r,g,b) -> let t1 = expr r and t2 = expr g and t3 = expr b in
      if (t1 = Int && t2 = Int && t3 = Int) then Color
      else raise (Failure ("expected an int input for type color"))    

      | ClusterLit(l,w,x,y,m,n,c) -> let t1 = expr l and t2 = expr w and t3 = expr x and t4 = expr y and t5 = expr m and t6 = expr n and t7 = expr c in
      if (t1 != Int) then raise (Failure ("expected an int input for type cluster, but you inputted: " ^ string_of_expr l))
      else        
      if (t2 != Int) then raise (Failure ("expected an int input for type cluster, but you inputted: " ^ string_of_expr w))
      else      
      if (t3 != Int) then raise (Failure ("expected an int input for type cluster, but you inputted: " ^ string_of_expr x))
      else
      if (t4 != Int) then raise (Failure ("expected an int input for type cluster, but you inputted: " ^ string_of_expr y))
      else   
      if (t5 != Int) then raise (Failure ("expected an int input for type cluster, but you inputted: " ^ string_of_expr m))
      else      
      if (t6 != Int) then raise (Failure ("expected an int input for type cluster, but you inputted: " ^ string_of_expr n))
      else 
      if (t7 != Color) then raise (Failure ("expected a color input for type cluster, but you inputted: " ^ string_of_expr c))
      else
      Cluster

      | Collision _ -> Bool
      | PropertyAccess (_, s) -> type_of_property s
      | PropertyAssign (_, s, e) ->  let eType = expr e and pType = type_of_property s in 
        if (eType != pType) then raise (Failure ("Incorrect type for assignment to property " ^ s)) else
        pType
      | Property _ -> raise (Failure ("Properties must be associated with an object"))
      | Id s -> type_of_identifier s
      | ArrayAccess(s, idx) -> let nameType = type_of_identifier_array s and i = expr idx in 
        ignore(is_array_num i (Failure ("Thou shall not index an array with a non-number type (array access)")));
        nameType

      | ArrayAssign(s, idx, e) -> let lt = type_of_identifier_array s and rt = expr e and i = expr idx in
        ignore(is_array_num i (Failure ("Thou shall not index an array with a non-number type (array assign)")));
        check_assign_array lt rt (Failure ("Thou shall not assign mismatched array types"))

      | ArrayInit(t, size) -> let typ = ArrayType(verify_array_init t) and len = expr size in
        ignore(is_array_num len (Failure ("Thou must use a num-type for size when initializing an array")));
        typ

      | ArrayDelete(s) -> verify_array s
      | Binop(e1, op, e2) as e -> let t1 = expr e1 and t2 = expr e2
    in 

    (match op with
        Add | Sub | Mult | Div | Mod when t1 = Int && t2 = Int -> Int
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
          
          (*Check mismatching number of arguments*)
          if List.length actuals != List.length fd.formals then
            raise (Failure ("expecting " ^ string_of_int
              (List.length fd.formals) ^ " arguments in " ^ string_of_expr call))

          (* Iterate over args and check if each of those passed match *)
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
