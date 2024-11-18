{
2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
   2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
   en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
	ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
	meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
	cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.
}


program practica3_2;
type
	casamiento=record
		dia:integer;
		mes:integer;
		anio:integer;
	end;
procedure datos(var fecha:casamiento);
	begin
		writeln('Ingrese dia');
		readln(fecha.dia);
			if(fecha.dia>30) then begin
				while(fecha.dia>30) do begin
					writeln('fecha invalida');
				end;
			end;
		writeln('Ingrese mes');	
		readln(fecha.mes);
			if(fecha.mes>12) then begin
				while(fecha.mes>12) do begin
					writeln('fecha invalida');
				end;
			end;
		writeln('Ingrese anio');
		readln(fecha.anio);
	end;

var
	fecha:casamiento;
	cant,cant10:integer;
BEGIN
	cant10:=0;
	cant:=0;
	fecha.anio:=0;
	fecha.mes:=0;
	fecha.dia:=0;
	while(fecha.anio<>2020)do begin
		datos(fecha);
		if(fecha.anio<>2020)then begin
			if(fecha.mes <=3)then cant:=cant+1;
			if(fecha.dia<=10)then cant10:=cant10+1;
		end;
	end;
	writeln('la cantidad de casamientos realizados durante los meses de verano:',cant);
	writeln('cantidad de casamientos realizados en los primeros 10 dias de cada mes:',cant10);
	
END.

