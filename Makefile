all: main.byte

main.byte: lexer.ml main.ml
	ocamlc -o main.byte lexer.ml parser.ml ast.ml abc_gen.ml main.ml

parser.ml parser.mli: parser.mly
	ocamlyacc parser.mly

lexer.ml: lexer.mll parser.cmi
	ocamllex lexer.mll

parser.cmi: parser.mli ast.cmi
	ocamlc -c parser.mli

ast.cmi: ast.mli
	ocamlc -c ast.mli

clean:
	rm -f *.cmi *.cmo *.cma *.byte lexer.ml parser.ml parser.mli
