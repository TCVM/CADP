program program2_17;
type
	cadena=string[20];
procedure datos(var num, cant, cantpar:integer;var apellido, nombre: cadena);
	begin
		readln(num);
		readln(apellido);
		readln(nombre);
		cant:= cant + 1;
		if(num mod 2 = 0) then cantpar:= cantpar + 1;
	end;
procedure chicos(num:integer; apellido:cadena;var min1, min2:integer; var ap1, ap2:cadena);
begin
	if(num < min1)then begin
		min2:= min1;
		min1:= num;
		ap2:=ap1;
		ap1:=apellido
	end
	else begin
		if (num < min2)then begin
			ap2:=apellido; 
			min2:=num;
		end;
	end;
end;
procedure grandes(num:integer; nombre:cadena;var max1, max2:integer; var nom1, nom2:cadena);
begin
	if(num > max1)then begin
		max2:= max1;
		max1:= num;
		nom2:=nom1;
		nom1:=nombre
	end
	else begin
		if (num > max2)then begin
			nom2:= nombre; 
			max2:=num;
		end;
	end;
end;
function porcentaje(num,cant,cantpar:integer):real;
	begin
			porcentaje:= (cant*cantpar)/100;
	end;
var 
	apellido, nombre, ap1, ap2, nom1, nom2:cadena;
	num, max1, max2, min1, min2,cant, cantpar:integer;
	aux:real;
BEGIN
	cant:= 0;
	cantpar:= 0;
	max1:=-1;
	max2:=-1;
	min1:=9999;
	min2:=9999;
	repeat
		datos(num,cant,cantpar,apellido,nombre);
		chicos(num,apellido,min1,min2,ap1,ap2);
		grandes(num,nombre,max1,max2,nom1,nom2);
		aux:= porcentaje(num,cant,cantpar);
	until(num=1200);
	writeln('Apellido de los dos alumnos con nro de inscripcion mas chico: ',ap1,' ',ap2);
	writeln('Nombre de los dos alumnos con nro de inscripcion mas grande: ',nom1,' ',nom2);
	writeln('Porcentaje de alumnos con nro de inscripcion par: ', aux:3:2,'%');
	
END.

