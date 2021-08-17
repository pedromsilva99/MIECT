grammar Declare;

program : decl* EOF
        ;

decl : 'dim' WORD '[' WORD ']' 'as' ('real' | 'integer') ';' #DimFromUnit
     | 'dim' WORD 'as' oper ';'                              #DimFromDim
     | 'unit' WORD 'as' oper ';'                             #UnitCreate
     | 'const' WORD 'as' NUM 'as' ('real' | 'integer') ';'   #ConstFromNumb
     | 'const' WORD 'as' NUM oper ';'                        #ConstFromOper
     ;


oper: a1=oper op=('*'|'/') a2=oper                          #OperAritm     //Oper unit
     | '(' oper ')'                                         #OperSub
     | (NUM | WORD)                                         #OperBasic
     ;

NUM     : [0-9]+('.'[0-9]+)? ;

WORD    : [a-zA-Z_][a-zA-Z_0-9]*;

COMMENT : '//' ~[\r\n]* -> skip;

WS      : [ \t\n\r]+ -> skip;
