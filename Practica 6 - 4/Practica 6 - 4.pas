{
Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la lista que son múltiplos de A.
}


//program practica6_4;

program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;
procedure armarNodo(var L: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := L;
		L := aux;
	end;
var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	writeln(‘Ingrese un numero’);
	read(valor);
	while (valor <> 0) then begin
		armarNodo(pri, valor);
		writeln(‘Ingrese un numero’);
		read(valor);
	end;
. . . { imprimir lista }
end;

//a)
{
	Function Maximo(L:lista):integer;
			var
				max:integer;
			begin
				while(L<>NIL)do begin
					if(L^.num>max)then max:=L^.num
					L:=L^.sig;
				end;
				Maximo:=max;
			end;
}
//b)	
{
	Function Minimo(L:lista):integer;
			min:integer;
			begin
				while(L<>NIL)do begin
					if(L^.num<min)then min:=L^.num
					L:=L^.sig;
				end;
				Minimo:=min;
			end;
}
//c)
{
		procedure Multiplo(L:lista;A:integer);
			var
				R,cant:integer;
			begin
				R:=0;
				while(L<>NIL)do begin
					R:=L^.num mod A;
					if(R=0)then cant:=cant + 1;
					L:=L^.sig;
				end;
			end;
}
