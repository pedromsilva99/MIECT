grammar Compiler;

program : (instructions)* EOF
        ;

instructions : 
             define ';'
            | print ';'
            | update ';'
            | decision ';'
            | incremento ';'
            | forLoop 
        ;

define : 
          tipo=WORD id=WORD                                        #defineID
        | tipo=WORD id=WORD '=' valor=operacao (unidades=units)?   #defineOperacao
        ;

update : 
          id=WORD '=' operacao        #updateNoDim   //para o caso da variavel 'WORD' já estar defenida, apenas atribuimos valor
        | id=WORD '=' operacao (unidades=units)    #updateDIM           //para o caso x = x + 10 minutes
        ;


print   : 'print' '(' INPUT ')'                                     #printInput
        | 'print' '(' operacao ')'                                  #printOper
        | 'print' '(' INPUT ('+' (INPUT|operacao) )* ')'      #printMultiple
        ;

operacao : 
          a1=operacao op=('*'|'/') a2=operacao      #multdiv
        | a1=operacao op=('-'|'+') a2=operacao      #subadd
        | '(' operacao ')'                          #parent
        | (v=NUM | v=WORD)                          #oper       //para constantes e grandezas pre estabelecidas |
        ;

units   : w1=units op=('*' | '/') w2=units          #unitOper                  //exemplo: 10m/s
        | w1=units op='^' e=NUM w2=units*           #unitSquared               //exemplo: 10m/s^2 | 10m/s^2*c
        | WORD                                      #unitName               //exemplo 10 m | 10 minutes(subdim of time)
        ;

decision: 'if''('condition')' 'then' instructions* breakCycle? elseIfs* 'end'       #if
        ;

elseIfs : 'elsif''('condition')' 'then' instructions* breakCycle? elseIfs*          #elseIf
        | 'else' instructions* breakCycle?                                          #lastElse
        ;

condition : a1=operacao op=('>' | '>=' | '<' | '<=' | '==' | '!=')  a2=operacao orAnd?           #condBasic
          | '!'? a1=operacao op=('>' | '>=' | '<' | '<=' | '==' | '!=')  a2=operacao orAnd?      #condNeg
          | '(' condition ')' orAnd?                                                             #condParentesis
          ;


forLoop: 'for''('(define|update)';'condition';'(operacao|incremento)')''{'(instructions)*'}'
        ;

incremento : WORD op=('++'|'--')   // ex: i++
           ;

orAnd  : op=('&&'|'||') condition
        ;

breakCycle
        : 'break'
        ;

NUM     : [0-9]+('.'[0-9]+)?;
// EXP     : ('-')?[0-9]+('.'[0-9]+)?;   (nao funciona ainda)
WORD    : [a-zA-Z_][a-zA-Z_0-9]*;
INPUT   : '"' .*? '"';     // qualquer input passado ao print
COMMENT : '//' ~[\r\n]* -> skip;
WS      : [ \t\n\r]+ -> skip;
