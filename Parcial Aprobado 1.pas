{
	Un servicio de comercio electronico desea analizar las ventas de notebooks durante la ultima edicion del hot sale. De cada notebook vendida
	se conoce su codigo de modelo (entre 1 y 200), marca, codigo del cliente y el medio de pago utilizado(1.credito;2.Debito;3.Transferencia;4.Mercado Pago;5.Bitcoin;6.otro).
	Ademas, el servicio dispone de una tabla con el valor de venta de cada uno de los modelos de notebooks.
		a)Realizar un modulo que retorne la informacion de las ventas de notebooks en una estructura de datos adecuada. La informacion se ingresa por teclado y debe almacenarse
		  debe almacenarse en el orden en que fue leida. La lectura finaliza cuando se ingresa el codigo de cliente -1.
		b)Realizar un modulo que reciba la informacion obtenida en el inciso anterior y retorne:
			i)los dos medios de pago que generaron el mayor monto total en ventas
			ii)Cantidad de notebooks de marca 'lenovo' vendidas a clientes cuyo codigo de cliente termina con un digito par.
}
program parcial;
type
	vcodmod = array[1..150]of integer;
	vcodso = array[1..6]of integer;
	vnotebook = record
		codmod:1..150;
		marca:string[20];
		codcli:integer;
		codso:1..6;
		end;
	vvalores = array[1..6]of real;
	lista=^nodo;
	nodo=record
		pato:vnotebook;
		sig:lista;
	end;
procedure valor de licencia(var v:vvalores)//se dispone
begin
end;

procedure leer(var n:vnotebook;);
begin
	write('codigo del modelo');readln(n.codmod);
	write('marca');readln(n.marca);
	write('codigo del cliete');readln(n.codcli);
	write('codigo del sistema operativo');readln(n.codso);
end;

procedure inicializar(var c:vcodso);
var
	i:integer;
begin
	for i:=1 to 6 do begin
		c[i]:=0;
	end;
end;

procedure agregar_atras(var l,ult:lista;n:vnotebook);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:=n;
	aux^.sig:=nil;
	if(l=nil)then begin
		l:=aux;
	end;
	else begin
		ult^.sig:=aux;
	end;
	ult:=aux;
end;

procedure cargarinfo(var l,ult:lista;n:vnotebook);
	begin
		leer(n);
		while(n.codcli<>-1)do begin
			agregaratras(l,ult,n);
			leer(n);
		end;
	end;
procedure retornar(l:lista;var cantcli,max1,max2:integer);
	var
		v:vvalores;c:vcodso;i:integer;
	begin
		while(l<>nil)do begin
			c:=c+v;
			if(l^.dato.marca= 'lenovo')and(l^.dato.codcli mod 2 = 0)then begin
				cantcli:=cantcli + 1;
			end;
		end;
		for i:=1 to 6 do begin
			if(v[i].>max1)then begin
				max2:=max1;
				max1:=v[i];
			end;
			else
				if(v[i]>max2)then begin
					max2:=v[i];
				end;
		end;
	end;
var
	v:valores;c:vcodso;l,ult:lista;n:vnotebook;cantcli,max1,max2:integer;
begin
	l:=nil;cantcli:=0;max1:=-1;max2:=-1;
	valore de licencia(v);
	inicializar(l);
	cargarinfo(l,ult,n);
	retorne(l,cantcli,max1,max2);
	writeln('los sistemas operativos con mayot monto en licencias son ',max1,' y ',max2);
	writeln('La cantidad de notebooks lenovo con codigo cliente par son', cantcli);
end;
	end;
