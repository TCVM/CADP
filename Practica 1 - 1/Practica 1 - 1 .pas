program Practica1_1;
var
	num1,num2: integer;
BEGIN
	readln(num1,num2);
	if (num1 < num2)then
		writeln ('El numero ',num2,' es mayor al numero ',num1);
	if (num1 > num2)then
		writeln ('El numero ',num1,' es mayor al numero ',num2)
	else
		writeln('Los numeros leidos son iguales');
END.

