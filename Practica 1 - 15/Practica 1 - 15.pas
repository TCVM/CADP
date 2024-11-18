program Practica1_15;

var
	i,cant,cod,codmin1,codmin2:integer;
	precio,preciomin1,preciomin2:real; 

BEGIN
	cant:= 0;
	codmin1:=0;
	codmin2:=0;
	preciomin1:=5000;
	preciomin2:=5000;
	for i:= 1 to 5 do
	begin
		readln(cod, precio);
		if(precio<preciomin1)then begin
			preciomin2:=preciomin1;
			preciomin1:=precio;
			codmin2:=codmin1;
			codmin1:=cod;
		end
		else begin
			if(precio<preciomin2)then begin
			preciomin2:=precio;
			codmin2:=cod;
			end;
		end;
		if(precio>16) AND ( cod mod 2 = 0)then begin
		cant:= cant + 1;
		end;
	end;
	writeln('Codigos de productos de menor precio: ', codmin1, ' y ', codmin2);
	writeln('Cantidad de productos con codigo par y con precio mayor a $16: ', cant);
	
END.

