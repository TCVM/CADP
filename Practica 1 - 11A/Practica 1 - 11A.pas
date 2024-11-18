program Practica1_11A;
var num,max,i,pos:integer;
BEGIN
	max:=-1;
	for i:= 1 to 10 do begin
		writeln('Ingrese numero');
		readln(num);
		if (num > max) then begin
			max:= num;
			pos:= i;
		end
	end;
	writeln('El mayor numero ingresado fue: ', max,' en la posicion: ' ,pos);
	
END.

