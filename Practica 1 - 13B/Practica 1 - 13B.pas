program Practica1_13B;
var num,min1,min2:integer;
BEGIN
	min1:=9999;
	min2:=9998;
	num:=-1;
	while(num<>0)do begin
		readln(num);
		if(num<>0)then begin
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
	end;
	writeln('Los dos numeros minimos leidos son: ', min1,' y ', min2);
END.

