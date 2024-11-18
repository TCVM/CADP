{
Dado el siguiente programa:
	a. Indicar qué hace el programa.
	b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
	c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
	d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
}


//program practica6_1;

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
		new(aux);w
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

//a)El programa se encagar de crear nodos y asignarles un entero dentro hasta que se ingrese el 0 que no debe procesarse.
//b)0 48 13 21 10
//c)
{ 
		procedure informar(L:lista);
			begin
				while(L<>NIL)do begin
					writeln(L^.num);
					L:=L^.sig;
				end;
			end;
			
}
//d)
{
		procedure incrementar(L:lista;n:integer);
			begin
				while(L<>NIL)do begin
					L^.num:=L^.num+n;
					L:=L^.sig;
				end;
			end;
}
