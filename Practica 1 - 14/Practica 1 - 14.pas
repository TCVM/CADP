program Practica1_14;
var num,max,min,total:integer;
BEGIN
	num:=0;
	max:=-1;
	min:=99;
	total:=0;
	repeat
		readln(num);
		if(num<min)then begin
			min:=num;
		end;
		if(num>max)then begin
			max:=num;
		end;
		total:= total + num;
	until(num = 100);
	writeln('Maximo: ',max,' minimo: ',min,' suma total: ',total);
END.

