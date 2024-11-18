program Practica1_17;
var 
	monto,total:real;
	i,cant:integer;
BEGIN
	total:=0;
	for i:=1 to 31 do
	begin
		monto:=-1;
		cant:= 0;
		while(monto <> 0) do
		begin
			readln(monto);
			if(monto <> 0)then begin
				total:= total + monto;
				cant:= cant + 1;
			end;
		end;
		writeln('Ventas realizadas: ', cant);
	end;
	writeln('Monto total acumulado del mes: ', total);
END.

