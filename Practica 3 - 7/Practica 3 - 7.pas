{
Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.   
}


program practica3_7;
type
	centros=record
		nombre:string;
		uni:string;
		cantI:integer;
		beca:integer;
	end;
procedure leer(var c:centros);
	begin
		writeln('Nombre');
		readln(c.nombre);
		writeln('Universidad');
		readln(c.uni);
		writeln('Cantidad de Investigadores');
		readln(c.cantI);
		writeln('Cantidad de becarios');
		readln(c.beca);
	end;
procedure MISSIONTWO(c:centros;var Max,acum:integer;var unimax:string);
	begin
		if(Max<acum)then begin
			Max:=acum;
			Unimax:=c.uni;
		end;
	end;
procedure MISSIONTHREE(c:centros;var min1,min2:integer;var cmin1,cmin2:string);
	begin
		if(min1>c.beca)then begin
			min2:=min1;
			min1:=c.beca;
			cmin2:=cmin1;
			cmin1:=c.nombre;
		end
		else if(min2>c.beca)then begin
				min2:=c.beca;
				cmin2:=c.nombre;
		end;
	end;
var
c:centros;
unimax,cmin1,cmin2,unitotal:string;
cantC,Max,acum,min1,min2:integer;
BEGIN
	min2:=9999;
	min1:=9999;
	Max:=-1;
	while(c.uni <> '0')do begin
		leer(c);
		cantC:=0;
		acum:=0;
		while(c.cantI<>0)do begin
			unitotal:=c.uni;
			cantC:= cantC+1;
			acum:=acum+c.cantI;
			MISSIONTWO(c,Max,acum,unimax);
			 MISSIONTHREE(c,min1,min2,cmin1,cmin2);
			leer(c);
		end;
		writeln('Cantidad total de centros en ',unitotal,': ',cantC);
	end;
	writeln('Universidad con mayor cantidad de investigadores: ',unimax); 
	writeln('Los dos centros con menor cantidad de becarios: ',cmin1,' y ',cmin2);
END.

