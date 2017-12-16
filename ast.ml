(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq | And | Or
type uop = Neg | Not


type typ = 
          Int
        | Float
        | String
        | Bool 
        | Void
        | Color 
        | Cluster
        | ArrayType of typ


type bind = typ * string

type expr =
    Literal of int
  | StringLit of string
  | FloatLit of float
  | BoolLit of bool
  | ColorLit of expr * expr * expr
  | ClusterLit of expr * expr * expr * expr * expr * expr * expr
  | Property of string
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | ArrayInit of string * typ * expr
  | ArrayAssign of string * expr * expr
  | ArrayAccess of string * expr
  | PropertyAccess of expr * string
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type program = bind list * func_decl list (*Redefine this, and like classes*)

(* Scolkam and another language *)

(* Pretty-printing functions *)

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Equal -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | String -> "string"
  | Void -> "void"
  | Float -> "float"
  | Color -> "color"
  | Cluster -> "cluster"
  | ArrayType(t) -> "ArrayType:" ^ string_of_typ t

let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | FloatLit(f) -> string_of_float f
  | StringLit(s) -> s
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | ColorLit(r,g,b) -> "<" ^ string_of_expr r ^ "," ^ string_of_expr g ^ "," ^ string_of_expr b ^ ">"
  | ClusterLit(l, w, _, _, _, _, c) -> "Cluster $" ^ string_of_expr l ^ "," ^ string_of_expr w ^ "," ^ string_of_expr c ^  "$"
  | PropertyAccess(e, p) -> string_of_expr e ^ p
  | Property(s) -> s
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | ArrayAccess(s, e) -> s ^ "[" ^ string_of_expr e ^ "]"
  | ArrayAssign(s, e1, e2) -> 
      s ^ "[" ^string_of_expr e1 ^"] ="^ string_of_expr e2 
  | ArrayInit(s, typ, len) -> "s = " ^ string_of_typ typ ^ "[" ^ string_of_expr len ^ "]"
  | Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  string_of_typ fdecl.typ ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)
