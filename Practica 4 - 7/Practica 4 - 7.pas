{
Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
	a. la cantidad de ocurrencias de cada dígito procesado.
	b. el dígito más leído.
	c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
	Número 3: 2 veces
	Número 4: 2 veces
	Número 6: 2 veces
	Número 9: 4 veces
	El dígito más leído fue el 9.
	Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}


program practica4_7;
type
	rango=0..9;
	digitos=array[rango]of integer;
procedure inicializar(v:digitos);
		var
		i:integer;
		begin
			for i:=0 to 9 do begin
				v[i]:=0;
			end;
		end;
procedure ocurrencias(var v:digitos;num:integer);
	var 
		digito:rango;
	begin
		while(num<>0)do begin
			digito:=num mod 10;
			v[digito]:=v[digito]+1;
			num:=num div 10;
			writeln(num);
		end;
	end;
function Maximo(v:digitos):integer;
	var i,max,pos:integer;
	begin
		i:=0;
		max:=0;
		pos:=0;
		for	i:=1 to 9 do begin
			if(max<v[i])then begin
				max:=v[i];
				pos:=i;
			end;
		end;
		Maximo:=pos;
	end;
procedure sinocurrencias(v:digitos);
	var
		i:integer;
	begin
		for i:=0 to 9 do begin
			if(v[i]=1) then writeln('No se repite ',i);
		end;
	end;
procedure informar(v:digitos);
	var
		i:integer;
	begin
		for i:= 0 to 9 do begin
			writeln('Cantidad de ',i,' es ',v[i]);
		end;
	end;
var 
	v:digitos;
	num:integer;
BEGIN
	inicializar(v);
	writeln('Ingrese numero');
	readln(num);
	while(num<>-1)do begin
		ocurrencias(v,num);
	writeln('Ingrese numero');
	readln(num);
	end;
	sinocurrencias(v);
	informar(v);
	writeln('Numero mas alto ', Maximo(v));
END.

