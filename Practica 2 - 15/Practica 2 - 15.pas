program practica2_15;
procedure descomponer(num:integer;var suma, cant, cantT:integer);
	var 
		dig:integer;
	begin
	    cant:=0;
	    suma:=0;
		while( num <> 0) do begin
			dig:= num mod 10;
			cant:= cant + 1;
			suma:= suma + dig;
			
			num:= num div 10;
		end;
		cantT:= cantT + cant;
		writeln(' cantidad de digitos que posee: ',cant,' suma de los digitos ',suma);
	end;
var
	num,suma, cant, cantT: integer;
BEGIN
	cantT:=0;
	repeat
		readln(num);
		descomponer(num,suma,cant, cantT);
	until(suma = 10);
	writeln(cantT);
END.

