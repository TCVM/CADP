program Practica0_6;
var
	monto,dolar,porcentaje: real;
BEGIN
	writeln('ingrese monto, precio del dolar y porcentaje de comision');
	readln(monto, dolar);
	porcentaje:= ((monto*dolar)*4)/100;
	writeln('La transaccion sera de : ', (monto*dolar)+ porcentaje:3:2);
END.

