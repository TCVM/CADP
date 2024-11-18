{
	a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:

	Tipo de zona 		Rendimiento por ha
		1 				6 toneladas por ha
		2 				2,6 toneladas por ha
		3 				1,4 toneladas por ha
		
	b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
	● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
	● La localidad del campo con mayor rendimiento económico esperado.
	● La localidad del campo con menor rendimiento económico esperado.
	● El rendimiento económico promedio.

}


program practica2_20;
type
	cadena=string[20];
procedure datos(var cantha,precio:real;var cont,tipo:integer;var local:cadena);
	begin
		writeln('localidad');
		readln(local);
		writeln('cantidad de hectareas');
		readln(cantha);
		writeln('tipo de zona de siembra');
		readln(tipo);
		//writeln('precio en U$S');
		//readln(precio);
		cont:=cont + 1;
	end;
procedure rendimientoest(local:cadena;tipo:integer;cantha:real;var TdFHA,rendimiento,acum:real);
	begin
		case tipo of
		1:rendimiento:=6*320;
		2:rendimiento:=2.6*320;
		3:rendimiento:=1.4*320;
		end;
		if(local='Tres de Febrero')and(rendimiento >= 10000)then begin
			TdFHA:=cantha;
		end;
		acum:=acum+rendimiento;
		writeln('rendimiento economico esperado:',rendimiento:3:2);
	end;
procedure MaxRen(var Max:cadena;local:cadena;var bestrend:real;rendimiento:real);
	begin
		if(rendimiento>bestrend) then
		begin
			Max:= local;
			bestrend:=rendimiento;
		end;
	end;
procedure MinRen(var Min:cadena;local:cadena;var worstrend:real;rendimiento:real);
	begin
		if(rendimiento<worstrend) then
		begin
			Min:= local;
			worstrend:=rendimiento;
		end;
	end;	
var
	cantha,precio,TdFHA,rendimiento,bestrend,worstrend,acum,prom:real;
	tipo,cont:integer;
	local,Max,Min:cadena;
BEGIN
	acum:=0;
	TdFHA:=0;
	bestrend:=0;
	worstrend:=9999;
	repeat
		datos(cantha,precio,cont,tipo,local);
		rendimientoest(local,tipo,cantha,TdFHA,rendimiento,acum);
		MaxRen(Max,local,bestrend,rendimiento);
		MinRen(Min,local,worstrend,rendimiento);
	until((local='Saladillo') and	(cantha = 900));
	prom:=acum/cont;
	writeln('cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000:',TdFHA:3:2);
	writeln('La localidad del campo con mayor rendimiento economico esperado:',Max);
	writeln('La localidad del campo con menor rendimiento economico esperado:',Min);
	writeln('El rendimiento economico promedio:',prom:3:2);
END.

