{
El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
}


program practica4_13;
const
	dimF=100;
	dimFA=50;
type
	puntos=array[1..dimF]of integer;
	anios=array[1..dimFA]of puntos;
procedure cargarvectores(var p:puntos;var a:anios;var prom:integer); 
	var
		i,j:integer;
	begin
		for j:= 1 to dimFA do begin
			for i:=1 to dimF do begin
			readln(p[i]);
			prom:=prom+1;
			end;
			a[j]:=p;
		end;
	end;
procedure Max(p:puntos; a:anios);
	var
		i,j,max,aniomax:integer;
	begin
		max:=0;
		for j:= 1 to dimFA do begin
			for i:=1 to dimF do begin
				if(a[j][i]>max) then begin
					max:=a[j][i];
					aniomax:=j;
				end;
			end;
		end;
		writeln(' el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años: ',aniomax);
	end;
procedure prom(p:puntos;a:anios;var prom:integer);
	var
		i,j,maxprom,anioprom:integer;
	begin
		maxprom:=0;
		for j:= 1 to dimFA do begin
			for i:=1 to dimF do begin
				if(prom>maxprom) then begin
					maxprom:=prom;
					anioprom:=j;
				end;
			end;
		end;
		writeln(' el año con mayor temperatura promedio a nivel mundial: ',anioprom);
	end;
var
	p:puntos;
	a:anios;
	promo:integer;
BEGIN
	cargarvectores(p,a,promo);
	Max(p, a);
	prom(p,a,promo);
END.

