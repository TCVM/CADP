Program ejercicio4;
procedure digParesImpares(num : integer; var par, impar : integer);
	var
		dig: integer;
	begin
		while (num <> 0) do begin
			dig:= num mod 10;
			write(dig);
			if((dig mod 2)= 0) then
				par := par + 1
			else
				impar:= impar +1;
				num := num DIV 10;
		end;
	end;
var
	dato, par, impar : integer;
begin
	par := 0;
impar := 0;
	repeat
		read(dato);
		digParesImpares(dato,par,impar);
	until (dato = 100);
	writeln('Pares:  ', par, ' impares: ', impar);
end.
