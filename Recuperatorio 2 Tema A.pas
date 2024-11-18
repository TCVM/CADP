{
La FIFA esta naalizando la informacion de resultados en los 18 partidos del mundial de futbol Uruguay 30. Para ello,
dispone de una estructura de datos con informacion de los goles realizados en todos los partidos. De cada gol se conoce
el numero de partido (entre 1 y 18) y el equipo que lo realizo. La informacion se encuentra ordenada por equipo

Realizar un porgrama que:

	1- Invoque a un modulo que retorne informacion de los 18 partidos almacenada en una estructura de datos adecuada.
	   De cada partido se conoce su numero (entre 1 y 18), nombre del estadio donde se jugo, y nombre de los dos equipos
	   o paises que participaron. Esta informacion se ingresa por teclado, y se ingresa sin ningun orden en particular.
	
	2- Invoque a un modulo que reciba la informacion de los goles y la informacion de los partidos, e informe:
	
		A) Cantidad de partidos con menos de 5 goles.
		B) Nombre del equipo con mayor cantidad de goles realizados en el estadio centenario
}


program Recuperatorio 2 Tema A;
const 
	dimf = 18;
type
	rango = 1 ... dimf;
	goles=record
		partido:rango;
		equipo:string;
	end;
	lista=^nodo;
	nodo=record
		dato:goles;
		sig:lista;
	end;
	partido=record
		partido=rango;
		estadio=string;
		equipo1=string;
		equipo2=string;
	end;
	vecpart=array[rango] of partido;
	veccont=array[rango] of integer;

procedure leer(var p:partido);
	readln(p.partido);
	readln(p.estadio);
	readln(p.equipo1);
	readln(p.equipo2);
end;	

procedure cargarpartido(var v:vecpart);
	var 
		p:partido;
		i:integer;
	begin
		for i:=1 to dimf do begin
			leer(p);
			v[p.partido]:=p;
		end;
	end;
	
procedure inivec(var v:veccont);
	var
		i:integer;
	begin
		for i:=1 to dimf do v[i]:=0;
	end;

procedure procesar(v:vecpartido;l:lista)
	var
		c:veccont;
		actual,max:string;
		golesactual,golesmax:integer;
	begin
		golesmax:=-1;
		while (L<>nil)do begin
			golesactual:=0;
			actual:=L^.dato.equipo;
			while(L<>nil)and(actual = L^.dato.equipo) do begin
				c[L^.dato.partido]:= c[L^.dato.partido]+1;
				if(v[L^.dato.partido].estadio = 'centenario')then golesactual:= golesactual + 1;
				L:=L^.sig;
			end;
			if(golesactual>golesmax) then begin
				golesmax:=golesactual;
				max:=actual;
			end;
		end;
		writeln(menos5(c));
		writeln(max);
	end;

function menos5(v:veccont):integer;
	var
		i,aux:integer;
	begin
		for i:=1 to dimf do begin
			if(v[i]<5)then aux:=aux + 1; 
		end;
		menos5:=aux;
	end;
var
	L: lista;
	v: vecpart;
	c:veccont;
BEGIN
	cargargoles(L);//se dispone
	inivec(c);
	cargarpartido(v);
	procesar(v,L);
END.

