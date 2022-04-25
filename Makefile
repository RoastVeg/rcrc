.POSIX:

PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

.PHONY: all
all:

# create a grammar that produces

.PHONY: qbe
qbe:
	git submodule update --init qbe
	$(MAKE) -C qbe

y.tab.h: rust.y
	yacc -d rust.y

lex.yy.c: rust.l
	lex rust.l

rcrc: y.tab.h lex.yy.c
	cc lex.yy.c y.tab.c -o rcrc

clean:
	rm -f y.tab.c y.tab.h lex.yy.c rcrc
