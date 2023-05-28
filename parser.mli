type token =
  | NOTE of (string)
  | SHARP
  | FLAT
  | DURATION of (int)
  | EOF

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.song
