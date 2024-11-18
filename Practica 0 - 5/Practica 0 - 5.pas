program Practica0_5;
var
	x,y:integer;
BEGIN
	writeln('Ingrese cantidad de caramelos y cantidad de clientes');
	readln(x,y);
	writeln('Caramelos por cliente : ', x div y , ' Resto sobrante : ', x mod y);
	writeln('total ganado: ', (x - x mod y)*1.60:3:2);
END.

