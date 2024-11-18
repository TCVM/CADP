{
La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.
}


program practica3_8;
type 
	docente=record
		DNI:integer;
		nomb:string;
		ape:string;
		email:string;
	end;
	proyecto=record
		cod:integer;
		title:string;
		doc:docente;
		alu:integer;
		esc:string;
		local:string;
	end;
procedure leer0(var d:docente);
	begin
		writeln('DNI');
		readln(d.DNI);
		writeln('Nombre');
		readln(d.nomb);
		writeln('Apellido');
		readln(d.ape);
		writeln('Email');
		readln(d.email);
	end;
procedure leer(var p:proyecto;var d:docente);
	begin
		writeln('codigo');
		readln(p.cod);
		writeln('Titulo');
		readln(p.title);
		writeln('Cantidad de Alumnos');
		readln(p.alu);
		writeln('Nombre de escuela');
		readln(p.esc);
		writeln('Localidad');
		readln(p.local);
		writeln('Docente');
		leer0(d);
	end;
procedure M2(p:proyecto;var MaxAlu1,MaxAlu2:integer;var esc1,esc2:string);
	begin
		if(MaxAlu1<p.alu)then begin
			MaxAlu2:=MaxAlu1;
			MaxAlu1:=p.alu;
			esc2:=esc1;
			esc1:=p.esc;
		end
		else if(MaxAlu2<p.alu)then begin
			MaxAlu2:=p.alu;
			esc2:=p.esc;
		end;
	end;
function M3(p:proyecto):boolean;
	var
		par,impar,aux:integer;
	begin
		par:=0;
		impar:=0;
		while(p.cod <> 0)do begin
			aux:=p.cod mod 10;
			if(aux mod 2 = 0)then begin
				par:= par + 1;
			end
			else impar:=impar + 1;
			p.cod:=p.cod div 10;
		end;
		M3:=(par=impar);
	end;
var
p:proyecto;
d:docente;
cantesc,cantescl,MaxAlu1,MaxAlu2:integer;
esc1,esc2,aux,aux2:string;
BEGIN
	cantesc:=0;
	cantescl:=0;
	while(p.cod <> -1)do begin
		leer(p,d);
		p.local:=aux;
		while((p.local = aux) and (p.cod <> -1))do begin
			p.esc:=aux2;
			if ((p.local='Daireaux')and(M3(p)))then begin
				writeln('Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares: ',p.title);
			end;
			while((p.esc = aux2) and (p.cod <> -1))do begin
				cantesc:=cantesc+1;
				cantescl:=cantescl+1;
				M2(p,MaxAlu1,MaxAlu2,esc1,esc2);
				leer(p,d);
			end;
			writeln('cantidad de escuelas por localidad: ',cantescl);
		end;
	end;
	writeln('Cantidad total de escuelas que participan en la convocatoria 2020: ',cantesc);
	writeln(' Nombres de las dos escuelas con mayor cantidad de alumnos participantes: ',esc1,' y ',esc2);
END.

