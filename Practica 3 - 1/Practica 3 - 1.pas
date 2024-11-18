{
Dado el siguiente programa:
	a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
	   la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
	   procesarse. Nota: utilizar el módulo leer.
	b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
       nombre del alumno con mejor promedio.  
}


program practica3_1;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;
procedure leer(var alu :alumno; var cant:integer; var prom:real; var besto:str20);
begin
	writeln('Ingrese el codigo del alumno');
	read(alu.codigo);
	if (alu.codigo <> 0) then begin
		writeln('Ingrese el nombre del alumno'); 
		read(alu.nombre);
		writeln('Ingrese el promedio del alumno');
		read(alu.promedio);
		cant:=cant+1;
		if(alu.promedio > prom)then besto:=alu.nombre;
	end;
end;
{ declaración de variables del programa principal }
var
	cant: integer;
	prom:real;
	a : alumno;
	besto:str20;
{ cuerpo del programa principal }
begin
	cant:=0;
	prom:=0;
	a.codigo:=1;
	a.promedio:=1;
	while(a.codigo <> 0)do begin
		leer(a,cant,prom,besto);
	end;
	writeln('cantidad de alumnos leidos',cant);
	writeln('nombre del alumno con mejor promedio',besto);
end.
