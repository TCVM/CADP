{
La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al espacio en la última década. 
De cada sonda se conoce su nombre, duración estimada de la misión (cantidad de meses que permanecerá activa), el costo de construcción, el 
costo de mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:

	1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma

Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
	a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
	b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
	c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
	d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una única vez.
}


program practica6_6;
type
	rango=1..7;
	vector=array[rango]of integer;
	sonda=record
		nombre:string;
		duracion:integer;
		costo:real;
		costomen:real;
		espec:rango;
	end;
	lista=^nodo;
	nodo=record
		dato:sonda;
		sig:lista;
	end;
	
procedure leer(var s:sonda);
	begin
		writeln('nombre');
		readln(s.nombre);
		writeln('duracion');
		readln(s.duracion);
		writeln('costo');
		readln(s.costo);
		writeln('costomen');
		readln(s.costomen);
		writeln('espec');
		readln(s.espec);
	end;

procedure inicializarvec(var v:vector);
	var i:integer;
	begin
		for i:=1 to 7 do v[i]:=0;
	end;
	
procedure cargarnodo(var l:lista;var s:sonda);
	var
		nue:lista;
	begin
		repeat
			leer(s);
			new(nue);
			nue^.dato:=s;
			nue^.sig:=l;
			l:=nue;
		until(s.nombre='GAIA');
	end;

procedure costosa(cost,costm:real;name:string;var max:string;var maxp:real);

	begin
		if(maxp<(cost+costm))then begin
			maxp:=cost+costm;
			max:=name;
		end;
	end;

procedure sondasrango(r:integer;var v:vector);
	var i:integer;
	begin
		i:=0;
		while(i<>r)do i:=i+1;
		v[i]:=v[i]+1;
	end;

procedure imprimvec(v:vector);
	var
		i:integer;
	begin
		for i:=1 to 7 do begin
			writeln('La cantidad de sondas que realizaran estudios en cada rango del espectro electromagnetico: ',v[i],' del rango ',i);
			writeln('--------------------------------------------------------------------------------------------------------------------');
		end;
	end;

procedure recorrer(l:lista;v:vector;var dprom,cprom:real);
	var
		max:string;
		cantT:integer;
		duraT,costT,maxp:real;
	begin
		maxp:=0;
		cantT:=0;
		duraT:=0;
		costT:=0;
		while(l<>nil)do begin
			cantT:=cantT+1;
			duraT:=duraT+l^.dato.duracion;
			costT:=costT+l^.dato.costo;
			costosa(l^.dato.costo,l^.dato.costomen,l^.dato.nombre,max,maxp);
			sondasrango(l^.dato.espec,v);
			l:=l^.sig;
		end;
		dprom:=duraT/cantT;
		cprom:=costT/cantT;
		writeln('El nombre de la sonda mas costosa: ',max);
		imprimvec(v);
	end;

procedure recorrer2(l:lista;dprom,cprom:real);
	var
		superdura:integer;
	begin
		superdura:=0;
		while(l<>nil)do begin
			if(l^.dato.duracion>dprom)then superdura:=superdura+1;
			if(l^.dato.costo>cprom)then begin
				writeln('nombre de las sondas cuyo costo de construccion supera el costo promedio entre todas las sondas: ',l^.dato.nombre);
			end
			else
				writeln('nombre de las sondas cuyo costo de construccion supera el costo promedio entre todas las sondas: ',0);
			l:=l^.sig;
		end;
		writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas: ',superdura);
	end;

var 
	s:sonda;
	l:lista;
	v:vector;
	dprom,cprom:real;
BEGIN
	l:=nil;
	inicializarvec(v);
	cargarnodo(l,s);
	recorrer(l,v,dprom,cprom);
	recorrer2(l,dprom,cprom);
END.

