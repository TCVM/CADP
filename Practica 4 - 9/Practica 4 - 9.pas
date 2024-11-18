{
Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}


program practica4_9;

const
	dimF=400;
type 
	alumno=record
		nro:integer;
		DNI:integer;
		ape:string;
		nombre:string;
		anio:integer;
	end;
	vector=array [1..dimF] of alumno;
procedure leer(var alu:alumno);
	begin
		writeln('DNI');
		readln(alu.DNI);
		if(alu.DNI <> -1)then begin
			writeln('nro de inscripcion');
			readln(alu.nro);
			writeln('apellido');
			readln(alu.ape);
			writeln('nombre');
			readln(alu.nombre);
			writeln('anio de nacimiento');
			readln(alu.anio);
		end
		else
			writeln('Fin');
	end;
function A(v:vector):integer;
	var
		dni,i,impares,dig:integer;
	begin
		A:=0;
		writeln('.');
		for i:=1 to dimF do begin
			dni:=v[i].DNI;
			impares:=0;
			while(dni <> 0)do begin
				dig:=dni mod 10;
				if(dig mod 2 <> 0)then begin
					impares:= impares + 1;
					dni:=dni div 10;
				end;
			end;
			if(impares = 0)then
			A:=A+1;
		end;
	end;
procedure Edad(v:vector;var ape,nomb,ape2,nomb2:string;var ed1,ed2:integer);
	var
		age,i:integer;
	begin
		for i:=1 to dimF do begin
			age:=2021-v[i].anio;
			if(age>ed1)then begin
				ed2:=ed1;
				ed1:=age;
				ape2:=ape;
				ape:=v[i].ape;
				nomb2:=nomb;
				nomb:=v[i].nombre;
			end
			else if(age>ed2)then begin
				ed2:=age;
				ape2:=v[i].ape;
				nomb2:=v[i].nombre;
			end;
		end;
	end;
var 
 i,ed1,ed2:integer;
 alu:alumno;
 v:vector;
 ape,nomb,ape2,nomb2:string;
BEGIN
	ed1:=0;
	ed2:=0;
	for i:=1 to dimF do begin
		leer(alu);
		v[i]:=alu;
	end;
	Edad(v,ape,nomb,ape2,nomb2,ed1,ed2);
	writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares es: ', A(v) div dimF * 100,'%');
	writeln('Apellido y nombre de los dos alumnos de mayor edad: ', ape,' ',nomb,' y ',ape2,' ',nomb2);
END.

