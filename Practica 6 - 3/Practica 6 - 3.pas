{
3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
	a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados (agregar atrás).
	b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron ingresados, manteniendo un puntero al último ingresado.
}


//program practica6_3;

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

//a-b)
{
	procedure armarNodo(var L,ULT: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := nil;
		if(L = nil)then
			L := aux;
		else
			ULT^.sig:=aux;
		ULT:=aux;
	end;
var
}
