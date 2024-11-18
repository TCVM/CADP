{
Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.
}


program practica4_2;
const
cant_datos = 150;
type
vdatos = array[1..cant_datos] of real;
procedure cargarVector(var v:vdatos; var dimL : integer);
var
	num:real;{ completa }
begin
	while(dimL<>cant_datos)and (num<>0)do begin
		dimL:=dimL+1; {Actua como For}
		v(dimL):=num;  {Le asigna a la dimension logica el valor de numero ingresado}
		writeln('Ingrese otro numero: ');
		readln(num);
	end;{ completa }
end;
procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
i:integer;{ completa }
begin
	for i:= 1 to dimL do begin
		v(i):=v(i)+n;
		sum:=sum+v(i);
	end;
end;
programa principal }
var
datos : vdatos;
i, dim : integer;
num, suma : real;
begin
dim := 0;
sumaTotal := 0;
cargarVector(v,dimL); { completar }
writeln(‘Ingrese un valor a sumar’);
readln(num);
modificarVectorySumar(v,dimL,n,suma);{completar}
writeln(‘La suma de los valores es: ’, suma);
writeln(‘Se procesaron: ’,dim, ‘ números’)
end.
