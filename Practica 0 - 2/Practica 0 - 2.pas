program untitled;
var
	N1,N2,suma:integer;
BEGIN
  writeln('Ingrese dos numeros (separados)');
  readln(N1, N2);
  suma:= N1 + N2;
  writeln('El resultado de la suma con variable auxiliar es : ' , suma);
  writeln('El resultado de la suma sin variable auxiliar es : ' , N1 + N2);
END.

