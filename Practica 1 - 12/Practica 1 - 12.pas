program Practica1_12;
var
	nombre: string[30];
	nota,cant8,cant7:integer; 


BEGIN
	cant8:= 0;
	cant7:= 0;
	repeat
		writeln('Ingrese nombre y nota');
		readln(nombre, nota);
		if(nota >= 8)then begin
			cant8:= cant8 + 1;
		end;
		if(nota = 7)then begin
			cant7:= cant7 + 1;
		end;
	until (nombre = 'Zidane Zinedine');
	writeln('Total de alumnos con nota mayor a 8: ', cant8);
	writeln('Total de alumnos que se sacaron 7: ', cant7);
END.
