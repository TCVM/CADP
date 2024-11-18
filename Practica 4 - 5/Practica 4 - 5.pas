{
Utilizando los módulos implementados en el ejercicio 3, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
}


program practica4_5;
const
	dimF=100;
type
	vector=array[1..dimF]of integer;

procedure leer(v:vector);
	var 
		i:integer;
		seguir:boolean;
	begin
		i:=1;
		writeln('Ingrese valores');
		while(seguir) and (i<dimF)do begin
			readln(v[i]);
			if(v[i] = 0)then seguir:=false;
			i:=i+1;
		end;
	end;
function Maximo(v:vector):integer;
	var i,max,pos:integer;
	begin
		i:=0;
		max:=0;
		pos:=0;
		for	i:=1 to dimF do begin
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
		for	i:=1 to dimF do begin
			if(min>v[i])then begin
				min:=v[i];
				pos:=i;
			end;
		end;
		Minimo:=pos;
	end;
procedure intercambio(v:vector);
	var aux,max,min:integer;
	begin	
			min:=Minimo(v);
			max:=Maximo(v);
			aux:=v[max];
			v[max]:=v[min];
			v[min]:=aux;
			writeln('intercambio ',max,min);
	end;
var 
v:vector;
BEGIN
	leer(v);
	intercambio(v);
END.

