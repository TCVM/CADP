program Practica1_8;
var
	v1,v2,v3:char;
	c1,c2,c3:boolean;
BEGIN
		readln(v1);
		Case v1 of
			'a': c1:= True;
			'e': c1:= True;
			'i': c1:= True;
			'o': c1:= True;
			'u': c1:= True;
			else c1:=False
		end;
		readln(v2);
		Case v2 of
			'a': c2:= True;
			'e': c2:= True;
			'i': c2:= True;
			'o': c2:= True;
			'u': c2:= True;
			else c2:=False
		end;
		readln(v3);
		Case v3 of
			'a': c3:= True;
			'e': c3:= True;
			'i': c3:= True;
			'o': c3:= True;
			'u': c3:= True;
			else c3:=False
		end;
	if(c1 = True) AND (c2 = True) AND (c3 = True)then begin
		writeln('Los tres son vocales');
	end
	else begin writeln('al menos un caracter no era vocal'); 
	end;
END.

