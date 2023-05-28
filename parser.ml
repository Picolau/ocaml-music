type token =
  | NOTE of (string)
  | SHARP
  | FLAT
  | DURATION of (int)
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Ast
# 13 "parser.ml"
let yytransl_const = [|
  258 (* SHARP *);
  259 (* FLAT *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* NOTE *);
  260 (* DURATION *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\003\000\003\000\000\000"

let yylen = "\002\000\
\002\000\001\000\002\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\007\000\000\000\000\000\000\000\000\000\
\006\000\001\000\003\000\004\000\005\000"

let yydgoto = "\002\000\
\004\000\005\000\006\000"

let yysindex = "\002\000\
\003\255\000\000\254\254\000\000\005\000\003\255\002\255\004\255\
\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\007\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\003\000\000\000"

let yytablesize = 9
let yytable = "\007\000\
\008\000\009\000\001\000\003\000\010\000\012\000\002\000\013\000\
\011\000"

let yycheck = "\002\001\
\003\001\004\001\001\000\001\001\000\000\004\001\000\000\004\001\
\006\000"

let yynames_const = "\
  SHARP\000\
  FLAT\000\
  EOF\000\
  "

let yynames_block = "\
  NOTE\000\
  DURATION\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'note_list) in
    Obj.repr(
# 16 "parser.mly"
                ( List.rev _1 )
# 76 "parser.ml"
               : Ast.song))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'note) in
    Obj.repr(
# 19 "parser.mly"
       ( [_1] )
# 83 "parser.ml"
               : 'note_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'note) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'note_list) in
    Obj.repr(
# 20 "parser.mly"
                 ( _1 :: _2 )
# 91 "parser.ml"
               : 'note_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 23 "parser.mly"
                      ( (Note (Char.uppercase_ascii _1.[0], Sharp), _3) )
# 99 "parser.ml"
               : 'note))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 24 "parser.mly"
                     ( (Note (Char.uppercase_ascii _1.[0], Flat), _3) )
# 107 "parser.ml"
               : 'note))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 25 "parser.mly"
                ( (Note (Char.uppercase_ascii _1.[0], Natural), _2) )
# 115 "parser.ml"
               : 'note))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.song)
