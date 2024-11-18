program practica2_16;
procedure descomponer(num:integer;var impar,par: integer);
	var 
		dig:integer;
	begin
		impar:=0;
		par:=0;
		while(num <> 123456)do begin
			dig:= num mod 10;
			if(dig mod 2 = 1)then 
				impar:= impar + 1
			else par:= par + dig;
			num:= num div 10;
		end;
	end;
var 
	impar,par, num:integer;
BEGIN
	repeat
		readln(num);
		descomponer(num,impar,par);
	until(num = 123456);
	writeln('cantidad de impares: ',impar,' suma de pares: ',par);
END.

