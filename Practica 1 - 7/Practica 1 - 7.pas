program Practica1_7;
var
	cod:integer;
	precio, precioN:real;
const
	last = 32767;
BEGIN
	while(cod <> last)do
		begin 
			writeln('Ingrese codigo, precio actual y precio nuevo');
			readln(cod, precio, precioN);
			if( precioN > precio +(precio*10)/100)then begin
				writeln('El precio nuevo supera en 10% al precio anterior');
			end
			else begin
				writeln('el precio nuevo no supera en 10% al precio anterior');
			end;
		end;
END.

