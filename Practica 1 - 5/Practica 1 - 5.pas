program Practica1_5;
var 
	num:real;
	num2:real;
	cont:integer;
BEGIN
	num2:=0;
	cont:=10;
	readln(num);
	while(num*2 <> num2) AND (cont>0)do
		begin
			writeln('ingrese numero,',cont,' intentos restantes');
			readln(num2);
			cont:= cont - 1;
		end;
	if(cont=0) and (num2 <> num*2)then begin
		writeln('No se ha ingresado el doble de X');
	end;
END.

