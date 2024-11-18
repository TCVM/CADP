{
El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
	● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
	● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
	a) Un módulo para la lectura de la información de la escuela.
	b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
	   de alumnos y la cantidad de docentes).   
}


program practica3_3;
type
	cadena=string[20];
	relevamiento=record
		local:cadena;
		nombre:cadena;
		cantDoc:integer;
		cantAlu:integer;
		CUE:integer;
	end;
procedure datos(var rel:relevamiento);
	begin
		writeln('localidad');
		readln(rel.local);
		writeln('nombre');
		readln(rel.nombre);
		writeln('Cantidad de Dococentes');
		readln(rel.cantDoc);
		writeln('Cantidad de Alumnos');
		readln(rel.cantAlu);
		writeln('CUE');
		readln(rel.CUE);
	end;
procedure relacion(var rel:relevamiento;var ship,ship1,ship2,cant:real;var CUE1,CUE2:integer;var nom1,nom2:cadena);
	begin
		ship:=rel.cantAlu/rel.cantDoc;
		if((ship>23435)and(rel.local='La Plata'))then cant:=ship;
		if(ship>ship1)then begin
			ship2:=ship1;
			ship1:=ship;
			nom2:=nom1;
			nom1:=rel.nombre;
			CUE2:=CUE1;
			CUE1:=rel.CUE;
		end
		else
			if(ship>ship2)then begin
				ship2:=ship;
				nom2:=rel.nombre;
				CUE2:=rel.CUE;
			end;
	end;
var
	ship,ship1,ship2,cant:real;
	CUE1,CUE2,i:integer;
	nom1,nom2:cadena;
	rel:relevamiento;
BEGIN
	cant:=0;
	ship:=0;
	ship1:=0;
	ship2:=0;
	CUE1:=0;
	CUE2:=0;
	for i:= 1 to 2400 do
	begin
		datos(rel);
		relacion(rel,ship,ship1,ship2,cant,CUE1,CUE2,nom1,nom2);
	end;
	writeln('Cantidad de escuelas de La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO;',cant:3:2);
	writeln('CUE y nombre de las dos escuelas con mejor relacion entre docentes y alumnos: ',CUE1,', ',nom1,' y ',CUE2,', ',nom2);
END.

