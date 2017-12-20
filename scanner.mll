(* Ocamllex scanner for Genesis *)

(* 
  Authors: 
   - Leon Stilwell
   - Michael Wang
   - Jason Zhao
   - Sam Cohen
 *)

{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "//"      { scomment lexbuf }         (* Comments *)
| "/*"      { comment lexbuf }          (* Comments *)
| '@'       { AT }
| '#'	    { POUND }
| '$'	    { DOLLAR }
| '('       { LPAREN }
| ')'       { RPAREN }
| '{'       { LBRACE }
| '}'       { RBRACE }
| '['       { LBRACKET }
| ']'       { RBRACKET }
| ';'       { SEMI }
| '%'       { MOD }
| '+'       { PLUS }
| '-'       { MINUS }
| '*'       { TIMES }
| '/'       { DIVIDE }
| '='       { ASSIGN }
| ','       { COMMA }
| '.'	    { DOT }
| "=="      { EQ }	
| "!="      { NEQ }
| '<'       { LT }
| "<="      { LEQ }
| ">"       { GT }
| ">="      { GEQ }
| "&&"      { AND }
| "||"      { OR }
| "!"       { NOT }
| "if"      { IF }
| "else"    { ELSE }
| "for"     { FOR }
| "while"   { WHILE }
| "return"  { RETURN }
| "int"     { INT }
| "float"   { FLOAT }
| "string"  { STRING }
| "bool"    { BOOL }
| "void"    { VOID }
| "color"   { COLOR }
| "cluster" { CLUSTER }
| "true"    { TRUE }
| "false"   { FALSE }
| "new"     { NEW }
| "delete"  { DELETE }
| ['0'-'9']+ as lxm { LITERAL(int_of_string lxm) }
| ['0'-'9']+'.'['0'-'9']+ as lxm { FLOATLIT(float_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm) }
| '"' (([^ '"'] | "\\\"")* as strlit) '"' { STRINGLIT(strlit) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }

and scomment = parse
  "\n" { token lexbuf }
 | _   { scomment lexbuf } 
