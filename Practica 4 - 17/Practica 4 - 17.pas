{
Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello, cuenta con información sobre todos los 
viajes realizados durante el mes de marzo. De cada viaje se cuenta con la siguiente información: día del mes (de 1 a 31), monto de dinero 
transportado y distancia recorrida por el camión (medida en kilómetros).
	a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
	b) Realizar un módulo que reciba el vector generado en a) e informe:
	   - El monto promedio transportado de los viajes realizados
	   - La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
	   - La cantidad de viajes realizados cada día del mes.
	c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}


program  practica4_17;
const
	dimF=200;
	day=31;
type 
	dias=1..31;
	viajes=record
		dia:dias;
		monto:real;
		dist:real;
	end;
	vecday=array[1..day]of integer;
	vector=array[1..dimF]of viajes;
procedure leer(var vi:viajes);
	begin
		writeln('Distancia');
		readln(vi.dist);
		if(vi.dist <> 0)then begin
			writeln('Dias');
			readln(vi.dia);
			writeln('Monto');
			readln(vi.monto);
		end;
	end;
procedure cargarvector(vi:viajes;var v:vector;var dimL:integer);
	begin
		dimL:=1;
		leer(vi);
		v[dimL]:=vi;
		while (v[dimL].dist<>0)and(dimL<=dimF)do begin
			dimL:=dimL+1;
			leer(vi);
			v[dimL]:=vi;
		end;
	end;
procedure inicializar(v:vecday);
	var
		i:integer;
	begin
		for i:=1 to day do v[i]:=0;
	end;
procedure diastotal(d:dias;var day:vecday);
	begin
		day[d]:=day[d]+1;
	end;
procedure BigSmoke(v:vector;dimL:integer;var d:vecday);
	var
		i:integer;
		acum,prom,min,mindist:real;
		daymin:dias;
	begin
		min:=9999;
		acum:=0;
		for i:=1 to dimL do begin
			if(v[i].monto<min)then begin
				min:=v[i].monto;
				mindist:=v[i].dist;
				daymin:=v[i].dia;
			end;
			acum:=v[i].monto+acum;
			diastotal(v[i].dia,d);
		end;	
		prom:=acum/dimL;
		writeln('El monto promedio transportado de los viajes realizados: ',prom:3:2);
		writeln('La distancia recorrida y el dia del mes en que se realizo el viaje que transporto menos dinero: ',mindist:3:2,', ',daymin);
	end;
procedure borrar(v:vector;var dimL:integer);
	var
		x:real;
		i,pos:integer;
	begin
		x:=100;
		i:=0;
		while(v[i].dist<>x)and(i<=dimL)do begin
			i:=i+1;
		end;
		if(i>dimL)or(x<>v[i].dist)or (i<1)then begin 
			writeln('No existe')
		end
		else begin
			for pos:=i+1 to dimL  do begin
				v[pos-1]:=v[pos];
			end;
			dimL:=dimL-1;
		writeln('Eliminados');
		end;
	end;
var
	dimL,i:integer;
	vi:viajes;
	v:vector;
	d:vecday;
BEGIN
	cargarvector(vi,v,dimL);
	inicializar(d);
	BigSmoke(v,dimL,d);
	borrar(v,dimL);
	for i:=1 to day do writeln('La cantidad de viajes realizados el dia ',i,': ',d[i]);	
END.

