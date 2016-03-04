OCB_FLAGS = -use-ocamlfind -I src
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		lib

clean:
			$(OCB) -clean

lib:
			$(OCB) opium_middleware_extra.cma
			$(OCB) opium_middleware_extra.cmxa
			$(OCB) opium_middleware_extra.cmxs


install:
	ocamlfind install opium_middleware_extra META _build/src/*.cma \
					              _build/src/*.cmxa \
						      _build/src/*.cmxs \
						      _build/src/*.cmo \
						      _build/src/*.cmx \
						      _build/src/*.cmi
.PHONY: 	all clean lib
