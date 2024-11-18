program untitled;
type
	cadena=string[30];
procedure datos(var cod:integer;var precio:real;tipo:cadena);
begin
	readln(cod);
	readln(precio);
	readln(tipo);
end;
procedure baratos(var minp1:real; var minp2:real; var codmin1:integer; var codmin2:integer; precio:real; cod:integer);
begin
	if(precio<minp1)then begin
		minp2:=minp1;
		codmin2:=codmin1;
		minp1:=precio;
		codmin1:= cod;
	end
	else begin 
		if(precio<minp2)then
		begin
		minp2:=precio;
		codmin2:=cod;
		end;
	end;
end;
function pant(tipo:cadena): boolean;
begin
	pant:=(tipo = 'pantalon');
end;
procedure pantalones(precioact:real; cod:integer; var maxpp:real; tipoact:cadena; var codpant:integer;pant:boolean);
begin
	if((pant(tipoact)) and (precioact > maxpp))then begin
		maxpp:=precio;
		codpant:=cod;
	end;
end;
var 
	i,cod,codmin1,codmin2,codpant:integer;
	precio,minp1,minp2,prom,acum,maxpp:real;
	tipo:cadena;
BEGIN
	minp1:=999;
	minp2:=999;
	maxpp:=0;
	codpant:=0;
	acum:=0;
	
	for i:= 1 to 2 do
	begin
		datos(cod,precio,tipo);
		baratos(minp1,minp2,codmin1,codmin2,precio,cod);
		pantalones(precio,cod,maxpp,tipo,codpant);
		acum:= acum + precio;
	end;
	prom:=acum/100;
	writeln('productos mas baratos ', codmin1,',',codmin2);
	writeln('pantalon mas caro ', codpant);
	writeln('promedio ', prom:4:3);
END.

