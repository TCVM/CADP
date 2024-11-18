{
   Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
	consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
	cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
	y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
	la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
	a. Realizar un módulo que lea la información de una línea de teléfono.
	b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
       módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
       del cliente.
  Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35
   
   
}


program practica3_4;
const
	PriceMs=3.40;
	PriceMB=1.35;
type
	cliente=record
		cantlineas,cod:integer;
	end;	
	lineas=record
		num:integer;
		mins:real;
		MB:real;
	end;
procedure datoslinea(var line:lineas);
	begin
		writeln('Numero');
		readln(line.num);
		writeln('Minutos Consumidos');
		readln(line.mins);
		writeln('MB Cosumidos');
		readln(line.MB);
	end;
procedure fusion(var client:cliente;var line:lineas;var cantMins,CantMB:real);
	var
		i:integer;
	begin
		writeln('Codigo');
		readln(client.cod);
		writeln('Cantidad de Lineas');
		readln(client.cantlineas);
		for i:= 1 to client.cantlineas do
		begin
			datoslinea(line);
			cantMins:=cantMins + line.mins;
			cantMB:=cantMB + line.MB;
		end;
	end;
function monto(cantMins,cantMB:real):real;
	var
		MinsTotal,MBTotal:real;
	begin
		MinsTotal:=cantMins*PriceMs;
		MBTotal:=cantMB*PriceMB;
		monto:=MinsTotal+MBTotal;
	end;
var 
	i:integer;
	cantMins,cantMB,aux:real;
	line:lineas;
	client:cliente;
BEGIN
	for i:=1 to 2 do
	begin
		cantMins:=0;
		cantMB:=0;
		fusion(client,line,cantMins,cantMB);
		aux:=monto(cantMins,cantMB);
		writeln('monto total a facturar: ',aux:3:2);
		writeln('cantidad total de minutos y la cantidad total de MB: ',cantMins:3:2,', ',cantMB:3:2);
	end;
END.

