{
 Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}


program practica2_18;

function vocal(c:char):boolean;

	begin
		vocal:=((c = 'A') or (c = 'E') or (c = 'I') or (c = 'O') or (c = 'U') or (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u'));
	end;
function alfabetico(c:char):boolean;
	begin
		alfabetico:=(((c >= 'A') and (c <= 'Z'))) or (((c >= 'a') and (c <= 'z')));
	end;
function novocal(c:char):boolean;
	begin
		novocal:=((alfabetico(c)) and (not vocal(c)));
	end;
procedure A(var ok:boolean);
	var
		c:char;
	begin
		readln(c);
		if(c = '$') then ok:= false;
		while((c<>'$') and (ok))do begin
			ok:=vocal(c);
			if(ok) then readln(c);
		end;
	end;
procedure B(var ok:boolean);
	var
		c:char;
	begin
		readln(c);
		if(c = '#') then ok:= false;
		while((c<>'#') and (ok))do begin
			ok:=novocal(c);
			if(ok) then readln(c);
		end;
	end;
var 
	ok:boolean;
BEGIN
	ok:=true;
	A(ok);
	if(ok) then
	begin
		B(ok);
		if(ok) then writeln('Secuencia correcta')
		else writeln('error en sector B');
	end
	else writeln('error en sector A');
END.

