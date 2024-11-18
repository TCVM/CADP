program Practica0_4;
var
	D,R:real;
BEGIN
	writeln('Ingrese diametro del circulo');
	readln(D);
	R:= D/2;
	writeln('El radio del circulo es ', R:2:2);
	writeln('El area del circulo es ', 3.14*R*R:2:2);
	writeln('El perimetro del circulo es ', 3.14*R*2:2:2);
END.

