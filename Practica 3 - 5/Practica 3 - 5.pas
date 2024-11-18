{
Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro. 
}

{program practica3_5;
type
	cadena=string[20];
	auto=record
		modelo:cadena;
		precio:real;
		marca:cadena;
		prom:real;
	end;
procedure lectura(var car:auto);
	begin
		writeln('Marca');
		readln(car.marca);
		writeln('modelo');
		readln(car.modelo);
		writeln('precio');
		readln(car.precio);
	end;
procedure max(var car:auto;var max1:real;var marca1,modelo1:cadena);
	begin
		if(car.precio>max1)then begin
			max1:=car.precio;
			marca1:=car.marca;
			modelo1:=car.modelo;
		end;
	end;
procedure jaja(var car:auto;var acum,max1:real;var marca1,modelo1:cadena);
	var
		cant:integer;
	begin
		cant:=0;
		while(car.marca <> 'ZZZ')do begin
			lectura(car);
			if(car.marca<> 'ZZZ')then begin
				acum:=acum+car.precio;
				cant:=cant + 1;
				car.prom:=acum/cant;
				max(car,max1,marca1,modelo1);
			end;
		end;
	end;

var
	acum,max1:real;
	marca1,modelo1:cadena;
	car:auto;
BEGIN
	max1:=0;
	acum:=0;
	while(car.marca<>'ZZZ')do
	begin
		jaja(car,acum,max1,marca1,modelo1);
		writeln('precio promedio por marca :',car.prom:3:2);
	end;
	writeln('Marca y modelo del auto mas caro :',marca1,' y ',modelo1);
END.
}
program practica3_5;
type

cadena:string[20];
rangom:1980..9999;

infoA:record;
	marca:cadena;
	modelo:rangom;
	precio:real;
end;

procedure leerauto(var aut:infoA);
begin
	writeln('Marca');
	readln(aut.marca);
	if (aut.marca <> 'ZZZ')then begin
		writeln('Modelo');
		readln(aut.modelo);
		writeln('Precio');
		readln(aut.precio);
	end;
end;

procedure maximo(act:infoA; var max:infoA);
begin
	if(act.precio > max.precio) then max:=act;
end;

var
	auto,automax:infoA;
	aux:cadena;
	acumulador:real;
	cantmarca:integer;
	
begin
	automax.precio:=-1;
	leerauto(auto);
	while(auto.marca<>'ZZZ')do begin
		aux:=auto.marca;
		cantmarca:=0;
		acumulador:=0;
		while((auto.marca=aux)and(auto.marca <> 'ZZZ'))do begin
			cantmarca:=cantmarca+1;
			acumulador:=acumulador+auto.precio;
			maximo(auto, automax);
			leerauto(auto);
		end;
		writeln('El precio promedio de la marca ', aux,' es ', (acumulador/cantmarca):2:2);
	end;
	if(automax.precio >-1)writeln('La marca y modelo del auto mas caro son: ', automax.marca, ' ', automax.modelo)
	else writeln('No hay autos');
end;
