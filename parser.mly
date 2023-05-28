%{
  open Ast
%}

%token <string> NOTE
%token SHARP FLAT
%token <int> DURATION
%token EOF

%start main
%type <Ast.song> main

%%

main:
| note_list EOF { List.rev $1 }

note_list:
| note { [$1] }
| note note_list { $1 :: $2 }

note:
| NOTE SHARP DURATION { (Note (Char.uppercase_ascii $1.[0], Sharp), $3) }
| NOTE FLAT DURATION { (Note (Char.uppercase_ascii $1.[0], Flat), $3) }
| NOTE DURATION { (Note (Char.uppercase_ascii $1.[0], Natural), $2) }