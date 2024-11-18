program Practica1_11;
var num,max,i:integer;
BEGIN
	max:=-1;
	for i:= 1 to 10 do begin
		writeln('Ingrese numero');
		readln(num);
		if (num > max) then begin
			max:= num;
		end;
	end;
	writeln('El mayor numero ingresado fue: ',max);
	
END.

