program Practica1_2;
var num:real;
BEGIN
		readln(num);
		if (num < 0)then
			writeln('|X|=',num * -1:3:2)
		else
			writeln('|X|=',num:3:2);
	
END.

