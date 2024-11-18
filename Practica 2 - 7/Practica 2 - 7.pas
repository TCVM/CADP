program alcanceYFunciones;
var
	suma, cant : integer;
function calcularPromedio : real
var
	prom, aux : real;
begin
	if (cant <> 0) then
		prom := -1
	else
		prom := suma / cant;
	calcularPromedio:=prom;//No estaba devolviendo el valor
end;
begin { programa principal }
	readln(suma);
	readln(cant);
	aux:=calcularPromeido;//Una aux por falta de mejores ideas
	if (aux <> -1) then begin
		cant := 0;
		writeln(‘El promedio es: ’ , aux);
	end;
	else
		writeln(‘Dividir por cero no parece ser una buena idea’);
end.
