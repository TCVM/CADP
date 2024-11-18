{
Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
}


program practica4_10;
const
	dimF=300;
type
	vector=array[1..dimF]of real;

procedure leer(v:vector;var dimL:integer);
	begin
		writeln('salario');
		readln(v[dimL]);
		while(v[dimL]<>0) and (v[dimL]<=dimF)do begin
				dimL:=dimL+1;
				writeln('salario');
				readln(v[dimL]);
		end;
	end;
procedure percetage(v:vector;dimL:integer;X:real);
	var
		i:integer;
	begin
		for i:=1 to dimL do begin
			v[i]:=v[i]*X;
			writeln('Nuevo sueldo',v[i]);
		end;
	end;
procedure promedio(v:vector;dimL:integer);
	var 
		i:integer;
		prom:real;
	begin
		prom:=0;
		for i:=1 to dimL do begin
			prom:=v[i] + prom;
		end;
		prom:=prom/dimL;
		writeln('Sueldo Promedio',prom:3:2);
	end;
var 
	v:vector;
	X:real;
	dimL:integer;

BEGIN
	dimL:=1;
	leer(v,dimL);
	writeln('ingrese porcentaje');
	readln(X);
	percetage(v,dimL,X);
	promedio(v,dimL);
END.

