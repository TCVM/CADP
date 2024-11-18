{
El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos de investigación avanzada. Para los proyectos 
de sondas espaciales vistos en el ejercicio anterior, se han determinado los siguientes criterios:

	- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
	- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la superficie terrestre con grandes antenas.
	
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar un programa que:

	a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos criterios H2020.
	b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y retorne dos listados, uno con los proyectos 
	   que cumplen con los nuevos criterios y otro con aquellos que no los cumplen.
	c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo total (construcción y mantenimiento) de los
	   proyectos que no serán financiados por H2020. Para ello, utilice el módulo realizado en b.
}


program practica6_7;
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
	procrit=^cumple;
	nocrit=^nocumple;
	
	nodo=record
		dato:sonda;
		sig:lista;
	end;
	
	cumple=record
		dato:sonda;
		sig:procrit;
	end;
	
	nocumple=record
		dato:sonda;
		sig:nocrit;
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

procedure cargarprocrit(var p,ult:procrit;s:sonda);
	var
		nue:procrit;
	begin
		new(nue);
		nue^.dato:=s;
		nue^.sig:=nil;
		if(p=nil)then begin
			p:=nue;
			ult:=nue;
		end
		else begin
			ult^.sig:=nue;
			ult:=nue;
		end;
	end;

procedure cargarnocrit(var n,ultn:nocrit;s:sonda);
	var
		nue:nocrit;
	begin
		new(nue);
		nue^.dato:=s;
		nue^.sig:=nil;
		if(n=nil)then begin
			n:=nue;
			ultn:=nue;
		end
		else begin
			ultn^.sig:=nue;
			ultn:=nue;
		end;
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
	
function criterios(l:lista):boolean;
	begin
		criterios:=((l^.dato.costo>l^.dato.costomen) and (l^.dato.espec<>1));
	end;
	
procedure recorrer(l:lista;v:vector;var dprom,cprom:real);
	var
		max:string;
		cantT:integer;
		duraT,costT,maxp:real;
		p,ult:procrit;
		n,ultn:nocrit;
	begin
		p:=nil;
		n:=nil;
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
			if(criterios(l))then begin
				cargarprocrit(p,ult,l^.dato);
				writeln('La sonda ',l^.dato.nombre,' cumple los criterios');
			end
			else begin
				cargarnocrit(n,ultn,l^.dato);
				writeln('La sonda ',l^.dato.nombre,' no cumple los criterios');
			end;
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
procedure recorrernocrit(n:nocrit);
	var
		cant:integer;
		costT:real;
	begin
		cant:=0;
		while(n<>nil)do begin
			cant:=cant+1;
			costT:=n^.dato.costo + n^.dato.costomen;
			n:=n^.sig;
		end;
		writeln('cantidad y el costo total de los proyectos que no serán financiados por H2020: ',cant,', ',costT);
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
