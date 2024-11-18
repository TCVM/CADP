program Practica1_3;
var top,mid,bot,num1,num2,num3:integer;
BEGIN
	readln(num1,num2,num3);
	if (num1>num2) OR (num1>num3)then begin
		if(num1>num2)then begin
			if(num1>num3)then begin
				top:=num1;
				if(num2>num3)then begin
					mid:= num2;
					bot:=num3;
				end
				else begin
					bot:= num2;
					mid:= num3;
				end;
			end
			else begin
				mid:=num1;
				top:=num3;
				bot:=num2
			end;
		end
		else begin
			if(num1>num3)then begin
				mid:=num1;
				bot:=num3;
				top:=num2
			end;
		end;
	end
	else begin
		bot:=num1;
		if(num2>num3)then begin
			top:= num2;
			mid:= num3;
		end
		else begin
			mid:= num2;
			top:= num3;
		end;
	end;
	writeln(top,mid,bot);
END.
