{
Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
	a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso contrario.
	b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: la lista podría no estar ordenada.
	c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los elementos de la lista L mayores que A y menores que B.
	d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera ascendente.
	e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera descendente.
}


program practica6_9;
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

//a)EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso contrario.
{
	function EstaOrdenada(L:lista):boolean;
		var
			ant:lista;
		begin
			ant:=l
				while(L<>nil)and(ant^.num <= L^.num)do begin
					ant:=L;
					L:=L^.sig;
				end;
			EstaOrdenada:=(L=nil);
		end;
}
//b) Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota: la lista podría no estar ordenada.
{
	procedure Eliminar(var l:lista;valor:integer);
		var
			ant,act:lista;
		begin
			act:=pri;
			while(act<>NIL)and(act^.num<>l^.num)do begin
				ant:=act;
				act:=act^.sig;
			end;
			if(act<>NIL) then begin
				if(act = l)then l:=l^.sig
				else ant^.sig:=act^.sig;
				dispose(act);
			end;
		end;
}
//c)Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos los elementos de la lista L mayores que A y menores que B.
{
	procedure Sublista(l:lista;a,b:integer;var l2:lista);
		var
			nue:lista;
		begin
			while(l<>nil)do begin
				if((l^.num>A)and(l^.num<B))then 
					armarNodo(L2,l^.num);
				l:=l^.sig;
			end;
		end;
}
//d)Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera ascendente.
{
	procedure SublistaAsc(l:lista;a,b:integer;var l2:lista);
		var
			nue:lista;
		begin
			while(l<>nil)and(l^.num<B)do begin
				if(l^.num>A)then 
					armarNodo(L2,l^.num);
				l:=l^.sig;
			end;
		end;
}
//e)Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera descendente.
{
	procedure SublistaAsc(l:lista;a,b:integer;var l2:lista);
		var
			nue:lista;
		begin
			while(l<>nil)and(l^.num>A)do begin
				if(l^.num<B)then 
					armarNodo(L2,l^.num);
				l:=l^.sig;
			end;
		end;
}





