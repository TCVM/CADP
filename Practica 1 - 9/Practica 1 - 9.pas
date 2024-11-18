program Practica1_9;
var 
	sim:char;
	resultado,num:integer;
BEGIN
	resultado:=0;
	readln(sim);
	if (sim = '+')then begin
		repeat
			writeln('ingrese un numero');
			readln(num);
			resultado:= resultado + num;
		until (num = 0);
	end;
	if (sim = '-')then begin
		repeat
			writeln('ingrese un numero');
			readln(num);
			resultado:= resultado - num;
		until (num = 0);
	end
	else begin writeln('Simbolo incorrecto'); end;
	writeln('El resultado es ', resultado);
	
END.

