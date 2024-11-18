{
La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les entregará el premio Joaquín V. González. De cada 
egresado se conoce su número de alumno, apellido y el promedio obtenido durante toda su carrera.
Implementar un programa que:
	a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
	b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados que recibirán el premio. La información
	   debe imprimirse ordenada según el promedio del egresado (de mayor a menor).
}


program practica6_11;
type
	alu=record
		num:integer;
		apellido:string;
		prom:real;
	end;
	lista=^nodo;
	nodo=record
		dato:alu;
		sig:lista;
	end;
	vector=array[1..10]of alu;

procedure leer(var a:alu);
	begin
		writeln('Numero');
		readln(a.num);
		if(a.num<>0)then begin
			writeln('apellido');
			readln(a.apellido);
			writeln('promedio');
			readln(a.prom);
		end;
	end;

procedure Insertarordenado(var l:lista;a:alu);
		var
			aux,act,ant : lista;
		begin
			new(aux);
			aux^.dato := a;
			act:=L;
			ant:=L;
			while(act<>nil)and(a.prom<aux^.dato.prom)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act=ant)then L:=aux
			else
				ant^.sig:=aux;
				aux^.sig:=act;
		end;	

procedure mejores(var v:vector;l:lista);
		var i:integer;
	begin
		i:=0;
		while (l<>nil)and (i<=10) do begin
			v[i]:= l^.dato;
			l:=l^.sig;
			i:=i+1;
		end;
		 writeln('Los 10 egresados que recibiran el premio Joaquín V. Gonzalez son: ');
    for i:= 1 to 10 do
    		
       writeln('El egresado ', v[i].apellido,' con numero ', v[i].num,' y promedio ',v[i].prom:2:3);
	end;
	
procedure cargarlista(var l:lista;v:vector);
	var
		a:alu;
	begin
		leer(a);
		while(a.num<>0)do begin
		Insertarordenado(l,a);
		leer(a);
		end;
		mejores(v,l);
	end;
var 
	l:lista;
	v:vector;
BEGIN
	l:=nil;
	cargarlista(l,v);
END.

