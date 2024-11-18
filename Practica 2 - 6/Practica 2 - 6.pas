//6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo.
//		Al finalizar la lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
//   b. Implemente un programa que invoque al módulo del inciso a.

program practica2_6;
procedure enteros;
var 
	maxn,ent:integer;
begin
	maxn:= 0;
	ent:= 0;
	while(ent >= 0)do
	begin
		readln(ent);
		if(ent mod 2 = 0) AND (ent>maxn)then maxn:=ent;
	end;
	writeln('Max num: ', maxn);
end;
begin
	enteros;
end.
