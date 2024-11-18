{
El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

	CÓDIGO ROL DEL DESARROLLADOR 	VALOR/HORA 	(USD)
		1 	Analista Funcional 					35,20
		2 	Programador 						27,45
		3 	Administrador de bases de datos 	31,03
		4 Arquitecto de software 				44,28
		5 Administrador de redes y seguridad 	39,87
		
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.
}


program practica4_14;
const
	dimF=1000;
type	
	rango=[1..1000];
	rango2=[1..5];
	vector=array[1..dimF]of devs;
	devs=record;
		pais:string
		cod:rango;
		nombre:string;
		rol:rango2;
		hs:real;
	end;
procedure leer(var d:devs);
	begin
		writeln('codigo');
		readln(d.cod);
		if(d.cod <> -1)then begin
			writeln('Pais');
			readln(d.pais);
			writeln('nombre');
			readln(d.nombre);
			writeln('rol');
			readln(d.rol);
			writeln('Horas');
			readln(d.hs);
		end;
	end;
procedure cargarvector(var d:devs;var v:vector);	
	var
		i:integer;
	begin
		for i:=1 to dimF do begin
			leer(d);
			v[i]:=d;
		end;
	end;
procedure monto(v:vector);
	acum:real;
	i:integer;
	begin
		acum:=0;
		for i:=1 to dimF do begin
			if(v[i].pais = 'Argentina')then begin
				case v[i].rol of
				1:v[i].rol:=acum + (v[i].hs*35,20);
				2:v[i].rol:=acum + (v[i].hs*27,45);
				3:v[i].rol:=acum + (v[i].hs*31,03);
				4:v[i].rol:=acum + (v[i].hs*44,28);
				5:v[i].rol:=acum + (v[i].hs*39,87);
			end;
		end;
		writeln('El monto total invertido en desarrolladores con residencia en Argentina: ',acum);
	end;
procedure admins(v:vector);
	i:integer;
	acum:real;
	begin
		acum:=0;
		for i:= 1 to dimF do begin
			if(v[i].rol = 3)then acum:=acum+v[i].hs;
		end;
	writeln('La cantidad total de horas trabajadas por Administradores de bases de datos: ',acum3:2);
	end;
procedure Arquis(v:vector);
	i,cont:integer
	begin
		cont:=0;
		for i:= 1 to dimF do begin
			if(v[i].rol = 4)then cont:=cont+1;
		end;
		writeln('La cantidad de Arquitectos de software de cada proyecto: ',cont);
	end;
procedure bajo(v:vector;var acum1:real);
	i,mincod:integer
	begin
		for i:=1 to dimF do begin
			case v[i].rol of
				1:v[i].rol:=acum1 + (v[i].hs*35,20);
				2:v[i].rol:=acum1 + (v[i].hs*27,45);
				3:v[i].rol:=acum1 + (v[i].hs*31,03);
				4:v[i].rol:=acum1 + (v[i].hs*44,28);
				5:v[i].rol:=acum1 + (v[i].hs*39,87);
				if(acum1<acum)then begin
					acum:=acum1;
					mincod:=v[i].cod;
				end
			end;
		end;
		writeln('El código del proyecto con menor monto invertido: ',mincod);
	end;
var 
	acum1:real;
	v:vector;
	d:devs;
BEGIN
	acum1:=0;
	cargarvector(d,v);
	monto(v);
	admins(v);
	Arquis(v);
	bajo(v,acum1);
END.

