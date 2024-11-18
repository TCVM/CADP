{
a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for?
 	1,2,3,4,5,6,7,8,9,10
b) Al terminar el programa, ¿con qué valores finaliza la variable números?
* 	3,6,10,15,21,28,36,45,55
c) Si se desea cambiar la línea 11 por la sentencia: for i:=1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)?
* numeros[i] := numeros[i+1] + numeros [i]
d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:
	for i:=1 to 9 do
	numeros[i+1] := numeros[i];
	1111111111....
}


program practica4_1;
 type
 vnums = array [1..10] of integer;
 var
 numeros : vnums;
 i : integer;
begin
i:=0;
 for i:=1 to 10 do begin{primer bloque for}
 numeros[i] := i;
 writeln(numeros[i]);
 end;
 for i := 1 to 9 do begin {segundo bloque for}
	numeros[i+1]:= ( numeros[i]);
	writeln(numeros[i+1]);
 end
end.
	
