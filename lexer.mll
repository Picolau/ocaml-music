{
  open Parser
}

rule token = parse
  | [' ' '\t' '\r' '\n'] { token lexbuf } (* Skip any whitespace *)
  | ['A'-'G'] as c { NOTE (String.make 1 c) }
  | 'R' as z { NOTE (String.make 1 z) }
  | "#" { SHARP }
  | "b" { FLAT }
  | ['0'-'9']+ as s { DURATION (int_of_string s) }
  | eof { EOF }
  | _ as c { failwith (Printf.sprintf "Unexpected character: %c" c) }