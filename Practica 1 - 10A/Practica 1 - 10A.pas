program Practica1_10A;
var
	num,sum,i,cant:integer;
BEGIN
	sum:=0;
	cant:=0;
	for i:= 1 to 10 do begin
		writeln('ingrese un numero');
		readln(num);
		if(num > 5)then begin
			cant:= cant + 1;
		end;
		sum:= sum + num;
		
	end;
	writeln('El total es ', sum,' cantidad de numeros mayores a 5: ', cant);
END.
