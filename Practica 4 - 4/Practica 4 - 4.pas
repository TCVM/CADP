{
   Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector  
}


program practica4_4;
const
	rango=100;
type
	vector=array[1..rango]of integer;
function posicion(v:vector;X:integer):integer;
	var i:integer;
	begin
		i:=0;
		while (v[i]<>X)or (i<100)do begin
			i:=i+1;
		end;
		if(v[i]<>X)then begin
			posicion:=-1;
		end
		else  
			posicion:=i;
	end;
procedure intercambio(v:vector;a,b:integer);
	var aux:integer;
	begin
		if((a<100)and(b<100))then begin;
			aux:=v[a];
			v[a]:=v[b];
			v[b]:=aux;
			writeln('intercambio ',a,b);
		end
		else writeln('por encima de rango');
	end;
function sumaVector(v:vector):integer;
	var i,acum:integer;
	begin
		i:=0;
		acum:=0;
		for	i:=1 to rango do begin
			acum:=acum + v[i];
		end;
		sumaVector:=acum;
	end;
function Promedio(v:vector):real;
	var i,acum:integer;
	begin
		i:=0;
		acum:=0;
		for	i:=1 to rango do begin
			acum:=acum + v[i];
		end;
		Promedio:=acum/rango;
	end;
function Maximo(v:vector):integer;
	var i,max,pos:integer;
	begin
		i:=0;
		max:=0;
		pos:=0;
		for	i:=1 to rango do begin
			if(max<v[i])then begin
				max:=v[i];
				pos:=i;
			end;
		end;
		Maximo:=pos;
	end;
function Minimo(v:vector):integer;
	var i,min,pos:integer;
	begin
		i:=0;
		min:=100;
		pos:=0;
		for	i:=1 to rango do begin
			if(min>v[i])then begin
				min:=v[i];
				pos:=i;
			end;
		end;
		Minimo:=pos;
	end;
var 
X:integer;
a,b:integer;
v:vector;

BEGIN
	writeln('Ingrese X ');
	readln(X);
	writeln('posicion ',	posicion(v,X));
	writeln('Ingrese x,y ');
	readln(a,b);
	writeln('sumaVector ',	sumaVector(v));
	writeln('Promedio ', Promedio(v));
	writeln('Maximo ',	Maximo(v));
	writeln('Minimo ', Minimo(v));
END.

