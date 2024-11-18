{
Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.
}


program practica4_3;
const
	dimF=100;
type
	vector=array[1..dimF] of integer;
procedure firsttolast(v:vector;dimL:integer);
	var
		i:integer;
	begin
		for i:= 1 to dimL do begin
			writeln(v[i]);
		end;
	end;
procedure lasttofirst(v:vector;dimL:integer);
	var
		i:integer;
	begin
		for i:= dimL downto 1 do begin
			writeln(v[i]);
		end;
	end;
procedure half(v:vector;dimL:integer);
	var
		i:integer;
	begin
		for i:= (dimL div 2) downto 1 do begin
			writeln(v[i]);
		end;
		for i:= ((dimL div 2)+1) to 1 do begin
			writeln(v[i]);
		end;
	end;
procedure XY(v:vector;X,Y,dimL:integer);
	var
		i:integer;
	begin
		if(X>Y)then begin
			for i:= Y to X do begin
				writeln(v[i]);
			end;
			for i:= X downto Y do begin
				writeln(v[i]);
			end;
			for i:= (X div 2) downto Y do begin
				writeln(v[i]);
			end;
			for i:= ((X div 2)+1) to Y do begin
				writeln(v[i]);
			end;
		end
		else begin
			for i:= X to Y do begin
				writeln(v[i]);
			end;
			for i:= Y downto X do begin
				writeln(v[i]);
			end;
			for i:= (Y div 2) downto X do begin
				writeln(v[i]);
			end;
			for i:= ((Y div 2)+1) to X do begin
				writeln(v[i]);
			end;
		end;
	end;		
var 
v:vector;
dimL,X,Y,i:integer;
BEGIN
	for i:=1 to dimF do v[i]:=0;
	writeln('dimL');
	readln(dimL);
	writeln('X');
	readln(X);
	writeln('Y');
	readln(Y);
	firsttolast(v,dimL);
	lasttofirst(v,dimL);
	half(v,dimL);
	XY(v,X,Y,dimL);
END.

