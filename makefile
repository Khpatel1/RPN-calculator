all: finalCalc test1 test2 test3

y.tab.c y.tab.h: rpnCalc.y
	bison -dy rpnCalc.y

lex.yy.c: rpnCalc.l y.tab.h
	flex rpnCalc.l

finalCalc: lex.yy.c y.tab.c y.tab.h
	gcc -o finalCalc y.tab.c lex.yy.c

test1:
	more test1.txt
	finalCalc.exe < test1.txt

test2:
	more test2.txt
	finalCalc.exe < test2.txt

test3:
	more test3.txt
	finalCalc.exe < test3.txt

clean:
	rm finalCalc y.tab.c lex.yy.c y.tab.h
