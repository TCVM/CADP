program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c }
procedure sumar(a, b, c:integer; var result: integer);
var
 suma,i : integer;
begin
 suma:=0;
 for i := a to b do
	begin
	 suma := suma + i;
	 c := c + suma;
	end;
 result:=c;
end;
var
 a,b,result : integer;
 ok:boolean;
begin
 result := 0;
 readln(a); readln(b);
 sumar(a, b, 0,result);
{ averigua si el resultado final estuvo entre 10 y 30}
 ok := (result >= 10) and (result <= 30);
if(ok)then write('La suma total es ',result)
else write ('La suma no quedo entre 10 y 30');
end.
