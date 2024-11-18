program Practica1_10;
var
	num,sum,i:integer;
BEGIN
	sum:=0;
	for i:= 1 to 10 do begin
		writeln('ingrese un numero');
		readln(num);
		sum:= sum + num;
	end;
	writeln('El total es ', sum);
END.


