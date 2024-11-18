program Practica1_13;
var num,min1,min2,i:integer;
BEGIN
	num:=0;
	min1:=9999;
	min2:=9998;
	for i:= 1 to 1000 do begin
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
	end;
	writeln('Los dos numeros minimos leidos son: ', min1,' y ', min2);
END.

