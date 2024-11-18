program Practica1_6;
var
	legajo, cantA, CantP, cant25: integer;
	prom, porc:real;
BEGIN
	legajo:= 0;
	cantA:= 0;
	cantP:= 0;
	cant25:= 0;
	while(legajo <> -1)do
		begin
			writeln('ingrese legajo y promedio');
			readln(legajo, prom);
			if( legajo <> -1)then begin
				cantA:= cantA + 1;
				 if(prom > 6.5) then begin
					cantP:= cantP + 1;
				 end;
				 if(prom > 8.5) AND (legajo < 2500)then begin
					cant25:= cant25 + 1;
				 end;
			end;
		end;
	porc:= (100*cant25)/cantA;
	writeln('Cantidad de alumnos:', cantP,' Cantidad de alumnos con promedio mayor a 6.5: ', cantP,' alumnos destacados (8.5) debajo de legajo 2500:', porc:2:2,'%');
END.

