{
Realizar un programa que lea y almacene la información de productos de un supermercado. De cada producto se lee: código,
descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa el código -1, que no debe procesarse. 
Una vez leída y almacenada toda la información, calcular e informar:
	a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
	b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
	c. Código de los dos productos más económicos.
}


program practica6_5;
type
	productos=record
		cod:integer;
		desc:string;
		stocka:integer;
		stockm:integer;
		precio:real;
	end;
	lista=^nodo;
	nodo=record
		dato:productos;
		sig:lista;
	end;
procedure leer(var p:productos);
	begin
		writeln('codigo');
		readln(p.cod);
		if(p.cod<>-1)then begin
			writeln('descripcion');
			readln(p.desc);
			writeln('stock actual');
			readln(p.stocka);
			writeln('stock minimo');
			readln(p.stockm);
			writeln('precio');
			readln(p.precio);
		end;
	end;
procedure crearnodo(var L:lista;p:productos);
	var
	aux:lista;
	begin
		new(aux);
		aux^.dato:=p;
		aux^.sig:=L;
		L:=aux;
	end;
procedure descomponer(L:lista;n:integer);
	var
	digito,cant:integer;
	begin
		cant:=0;
		while(L<>nil)do begin
			while (n<>0) do begin
				digito:=n mod 10;
				if (digito mod 2=0) then cant:=cant+1;
				n:= n div 10;
			end;
			if(cant>=3)then writeln('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares: ',L^.dato.desc)
			else writeln('Descripcion de aquellos productos con codigo compuesto por al menos tres digitos pares: ',0);
			L:=L^.sig;
		end;
	end;
procedure Minimos(L:lista);
	var
		min1,min2:real;
		mcod1,mcod2:integer;
	begin
		min1:=999;
		min2:=999;
		mcod1:=0;
		mcod2:=0;
		while(L<>nil)do begin
			if(L^.dato.precio<min1)then begin
				min2:=min1;
				min1:=L^.dato.precio;
				mcod2:=mcod1;
				mcod1:=L^.dato.cod;
			end
			else if(L^.dato.precio<min2)then begin
				min2:=L^.dato.precio;
				mcod2:=L^.dato.cod;
			end;
			L:=L^.sig;
		end;
			writeln('Codigo de los dos productos mas economicos: ',mcod1,' y ', mcod2);
	
	end;
procedure stocks(L:lista);
	var
		cant,cants:real;
	begin
		cant:=0;
		cants:=0;
		while(L<>nil)do begin
			cant:=cant+1;
			if(L^.dato.stocka<L^.dato.stockm)then cants:=cants +1;
			L:=L^.sig;
		end;
		writeln('Porcentaje de productos con stock actual por debajo de su stock minimo: ',((cants/cant)*100):3:2,'%');
	end;
var 
	p:productos;
	L:lista;
BEGIN
	L:=nil;
	leer(p);
	while(p.cod<>-1)do begin
		crearnodo(L,p);
		leer(p);
	end;
	Minimos(L);
	stocks(L);
	descomponer(L,L^.dato.cod);
END.

