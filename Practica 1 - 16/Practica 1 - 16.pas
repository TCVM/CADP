program Practica1_16;
var
	piloto,piloto1,piloto2,piloto99,piloto100: string [30];
	tiempo,tiempo1,tiempo2,tiempo99,tiempo100: real;
	i:integer;
BEGIN
tiempo1:= 9999;	
tiempo2:= 9999;	
tiempo99:= -1;	
tiempo100:= -1;	
	for i:= 1 to 100 do 
	begin
		readln(piloto);
		readln(tiempo);
		if(tiempo<tiempo1)then begin
			tiempo2:=tiempo1;
			tiempo1:=tiempo;
			piloto2:= piloto1;
			piloto1:=piloto;
		end
		else begin
			if(tiempo<tiempo2)then begin
				tiempo2:=tiempo;
				piloto2:=piloto;
			end;
		if(tiempo>tiempo100)then begin
			tiempo99:= tiempo100;
			tiempo100:=tiempo;
			piloto99:=piloto100;
			piloto100:=piloto;
		end
		else begin
			if(tiempo>tiempo99)then begin
				tiempo99:=tiempo;
				piloto99:=piloto;
			end;
		end;
		end;
	end;
	writeln('Piloto con mejor tiempo: ', piloto1,' segundo puesto: ',piloto2);
	writeln('Piloto con peor tiempo: ', piloto100,' anteultimo puesto: ',piloto99);
END.

