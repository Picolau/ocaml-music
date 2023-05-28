let () =
  let lexbuf = Lexing.from_channel stdin in
  let ast = Parser.main Lexer.token lexbuf in
  let checked_ast = Ast.check_song ast in
  match checked_ast with
  | Ok song -> 
    Abc_gen.create_abc_file "output" song
  | Error e -> failwith e;;