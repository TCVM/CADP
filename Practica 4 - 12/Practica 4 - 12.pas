{
En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
}


program practica4_12;
const
	dimF=53;
type
	rangetype=1..4;
	galaxy=record
	nombre:string;
	tipo:rangetype;
	masa:real;
	pc:real;
	end;
	vector=array[1..dimF]of galaxy;
procedure leer(var g:galaxy);
	begin
		writeln('Nombre');
		readln(g.nombre);
		writeln('Tipo');
		readln(g.tipo);
		writeln('masa');
		readln(g.masa);
		writeln('PC');
		readln(g.pc);
	end;
procedure cargarvector(var v:vector;var g:galaxy);
	var
		i:integer;
	begin
		for i:=1 to dimF do begin
			leer(g);
			v[i]:=g;
		end;
	end;
procedure CantG(v:vector);
	var
		tipo1,tipo2,tipo3,tipo4,i:integer;
	begin
		for i:=1 to dimF do begin
			tipo1:=0;
			tipo2:=0;
			tipo3:=0;
			tipo4:=0;
			case v[i].tipo of
				1:tipo1:=tipo1 + 1;
				2:tipo2:=tipo2 + 1;
				3:tipo3:=tipo3 + 1;
				4:tipo4:=tipo4 + 1;
			end;
		end;
		writeln('Tipo 1: ',tipo1, 'Tipo 2: ',tipo2,'Tipo 3: ',tipo3,'Tipo 4: ',tipo4);
	end;
procedure masa(v:vector);
	var
		i:integer;
		acum1,acum2,porcentaje:real;
	begin
		acum1:=0;
		acum2:=0;
		porcentaje:=0;
		for i:=1 to dimF do begin
			if((v[i].nombre = 'la Vía Láctea') or (v[i].nombre = 'Andrómeda') or (v[i].nombre = 'Triángulo'))then begin
				acum1:=acum1 + v[i].masa;
			end
			else acum2:=acum2+ v[i].masa;
		end;
		porcentaje:= acum1/acum2 * 100;
		writeln('la masa total acumulada de las 3 galaxias principales (la Via Lactea, Andromeda y Triangulo)',acum1:3:2,' y el porcentaje que esto representa respecto a la masa de todas las galaxias  ',porcentaje:3:2,'%');
	end;
procedure irregular(v:vector);
	var
		 i,cant:integer;
	begin
		cant:=0;
		for i:=1 to dimF do begin
			if(v[i].pc<1000)and not(v[i].tipo = 4)then cant:= cant + 1;
		end;
	writeln('la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc: ',cant);
	end;
procedure maxmin(v:vector);
	var
		i:integer;
		max1,max2,min1,min2:real;
		maxnom1,maxnom2,minnom1,minnom2:string;
	begin
		i:=0;
		max1:=0;
		max2:=0;
		min1:=999;
		min2:=999;
		for i:= 0 to dimF do begin
			if(v[i].masa>max1)then begin
				max2:=max1;
				max1:=v[i].masa;
				maxnom2:=maxnom1;
				maxnom1:=v[i].nombre;
			end
			else if(v[i].masa>max2)then begin
				max2:=v[i].masa;
				maxnom2:=v[i].nombre;
			end;
			if(v[i].masa<min1)then begin
				min2:=min1;
				min1:=v[i].masa;
				minnom2:=minnom1;
				minnom1:=v[i].nombre;
			end
			else if(v[i].masa<min2)then begin
				min2:=v[i].masa;
				minnom2:=v[i].nombre;
			end;
		end;
		writeln('el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa: ',maxnom1,', ',maxnom2,' y ',minnom1,', ',minnom2);
	end;
var 
	v:vector;
	g:galaxy;
BEGIN
	cargarvector(v,g);
	CantG(v);
	masa(v);
	irregular(v);
	maxmin(v);
END.

