{
Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.
}
program practica2_19;

procedure A(var ok:boolean;var cant:integer);
	var
		c:char;
	begin
		cant:=0;
		readln(c);
		if(c = '%') then ok:= false;
		while((c<>'%') and (ok))do begin
			cant:= cant + 1;
			ok:= c <> '$';
			if(ok) then readln(c);
		end;
	end;
procedure B(var ok:boolean; cantA:integer);
	var
		c:char;
		arrobas,cant:integer;
	begin
		cant:=0;
		arrobas:=0;
		readln(c);
		if(c = '*') then ok:= false;
		while((c<>'*') and (cant<=cantA) and (arrobas<=3) and (ok))do begin
			ok:=true;
			if(c = '@') then arrobas:=arrobas + 1;
			if(ok) then readln(c);
			cant:=cant + 1;
		end;
		if(cant <> cantA) then ok:=false;
		if(arrobas < 3) then ok:=false;
	end;
var 
	ok:boolean;
	cantA:integer;
BEGIN
	ok:=true;
	A(ok,cantA);
	if(ok) then
	begin
		B(ok,cantA);
		if(ok) then writeln('Secuencia correcta')
		else writeln('error en sector B');
	end
	else writeln('error en sector A');
END.

