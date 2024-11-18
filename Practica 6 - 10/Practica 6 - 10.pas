{
Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su funcionamiento 
es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número (que es el siguiente al último número entregado).
El cliente quedará esperando a ser llamado por su número, en cuyo caso sale de la lista de espera. Se pide:

	a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
	b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
	c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido
	   debe eliminarse de la lista de espera.
	d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se 
	   los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.
}


program practica6_10;
type
	client=record
		dni:integer;
		num:integer;
	end;
	lista=^nodo;
	nodo=record
		datos:client;
		sig:lista;
	end;
	
procedure leer(var c:client);
	begin
		writeln('DNI');
		readln(c.dni);
		if(c.dni<>0)then c.num:=c.num+1;
	end;


procedure RecibirCliente(var l:lista;c:client);
	var
		nue,ult:lista;
	begin
		ult:=l;
		new(nue);
		nue^.datos:=c;
		nue^.sig:=nil;
		if(l=nil)then l:=nue
		else ult^.sig:=nue;
		ult:=nue;
	end;
procedure AtenderCliente(var l:lista);
	var 
		ant,act:lista;
		num:integer;
	begin
		writeln('ingrese numero de cliente');
		readln(num);
		act:=l;
		while(act<>nil)and(num<>act^.datos.num)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act<>nil)then begin
			if(act=l)then begin 
				l:=l^.sig;
				writeln('numero y DNI del cliente atendido: ',act^.datos.num,' y ',act^.datos.dni);
			end
			else if(act<>l)then begin
				ant^.sig:=act^.sig;
				writeln('numero y DNI del cliente atendido: ',act^.datos.num,' y ',act^.datos.dni);
				dispose(act);
			end;
		end;
	end;
var
	l:lista;
	c:client;
BEGIN
	l:=nil;
	leer(c);
	while(c.dni<>0)do begin
		RecibirCliente(l,c);
		leer(c);
	end;
	AtenderCliente(l);
END.

