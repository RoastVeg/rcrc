%{
/// https://github.com/rust-lang/rust/blob/master/compiler/rustc_lexer/src/lib.rs
#define YYSTYPE char *
#include <stdio.h>
#include "y.tab.h"

extern void yyerror(const char *);
%}
%%
"abstract"                                        return KW_ABSTRACT;
"as"                                              return KW_AS;
"async"                                           return KW_ASYNC;
"await"                                           return KW_AWAIT;
"become"                                          return KW_BECOME;
"box"                                             return KW_BOX;
"break"                                           return KW_BREAK;
"const"                                           return KW_CONST;
"continue"                                        return KW_CONTINUE;
"crate"                                           return KW_CRATE;
"do"                                              return KW_DO;
"dyn"                                             return KW_DYN;
"else"                                            return KW_ELSE;
"enum"                                            return KW_ENUM;
"extern"                                          return KW_EXTERN;
"false"                                           return KW_FALSE;
"final"                                           return KW_FINAL;
"fn"                                              return KW_FN;
"for"                                             return KW_FOR;
"if"                                              return KW_IF;
"impl"                                            return KW_IMPL;
"in"                                              return KW_IN;
"let"                                             return KW_LET;
"loop"                                            return KW_LOOP;
"macro"                                           return KW_MACRO;
"match"                                           return KW_MATCH;
"mod"                                             return KW_MOD;
"move"                                            return KW_MOVE;
"mut"                                             return KW_MUT;
"override"                                        return KW_OVERRIDE;
"priv"                                            return KW_PRIV;
"pub"                                             return KW_PUB;
"ref"                                             return KW_REF;
"return"                                          return KW_RETURN;
"self"                                            return KW_SELFVALUE;
"Self"                                            return KW_SELFTYPE;
"'static"                                         return KW_STATICLIFETIME;
"static"                                          return KW_STATIC;
"struct"                                          return KW_STRUCT;
"super"                                           return KW_SUPER;
"trait"                                           return KW_TRAIT;
"true"                                            return KW_TRUE;
"try"                                             return KW_TRY;
"type"                                            return KW_TYPE;
"typeof"                                          return KW_TYPEOF;
"union"                                           return KW_UNION;
"unsafe"                                          return KW_UNSAFE;
"unsized"                                         return KW_UNSIZED;
"use"                                             return KW_USE;
"virtual"                                         return KW_VIRTUAL;
"where"                                           return KW_WHERE;
"while"                                           return KW_WHILE;
"yield"                                           return KW_YIELD;
[a-zA-Z][a-zA-Z0-9_]*|_[a-zA-Z0-9_]+              yylval=strdup(yytext); return IDENTIFIER;
"r#"                                              return RAW_PREFIX;
"//"([^"/" "!"]|" //")[^\n]*|"//"                 return LINE_COMMENT;
"/**/"|"/***/"                                    return BLOCK_COMMENT_EMPTY;
\r.                                               return ISOLATED_CR;
%%

int yywrap()
{
    return 1;
}

void main()
{
    yyparse();
}
