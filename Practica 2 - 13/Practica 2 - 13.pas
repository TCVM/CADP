program practica2_13;
function doble(a:integer;b:integer):boolean;
begin
	doble:= false;
	if(b = a*2)then
	begin 
		doble:=true;
		
	end;
end;
var
	a,b:integer;
	zero,bu:boolean;
	cant2,cantpar:integer;
BEGIN
	a:=0;
	b:=0;
	cantpar:=0;
	cant2:=0;
	repeat
		readln(a,b);
		zero:=(a=0) and (b=0);
		bu:=doble(a,b);
		if(bu=true)and (not zero)then cant2:= cant2 + 1;
		cantpar:= cantpar+1;
	until(zero);
	writeln(cantpar,',', cant2);
END.

