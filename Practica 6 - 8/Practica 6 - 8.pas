{
Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista queden ordenados de manera ascendente (insertar ordenado).
}


program practica6_8;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;
procedure armarNodo(var L: lista; v: integer);
	var
		aux,act,ant : lista;
	begin
		new(aux);
		aux^.num := v;
		act:=L;
		ant:=L;
		while(act<>nil) and (l^.num>aux^.num)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act=ant)then L:=aux
		else
			ant^.sig:=aux;
			aux^.sig:=act;
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

