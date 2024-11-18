program Practica1_13A;
var num,min1,min2:integer;
BEGIN
	min1:=9999;
	min2:=9998;
	repeat
		readln(num);
		if(num<min1)then begin
			min2:=min1;
			min1:=num;
		end
		else begin
			if(num<min2)then begin
				min2:=num;
			end;
		end;
	until(num = 0);
	writeln('Los dos numeros minimos leidos son: ', min1,' y ', min2);
END.

