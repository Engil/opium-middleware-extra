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
	ocamlfind install opium_middleware_extra META _build/src/opium_middleware_extra.cma \
					              _build/src/opium_middleware_extra.cmxa \
						      _build/src/opium_middleware_extra.cmxs \
						      _build/src/opium_middleware_extra.cmo \
						      _build/src/opium_middleware_extra.cmx \
						      _build/src/opium_middleware_extra.cmi
.PHONY: 	all clean lib
