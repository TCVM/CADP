{
Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de asistencias a clase.
Dicha información se encuentra ordenada por nro de alumno de manera ascendente. Se pide:
	a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
	b. Un módulo que reciba un alumno y lo inserte en el vector.
	c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
	d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
	e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos leídos de teclado.
}


program practica4_18;

//a
function posicion(v:vector;nrm,dimL:integer):integer;
	var
		i:integer;
	begin
		for i:=1 to dimL;
			if(v[i]=num)then posicion:=i;
		end;
	end;
//b
procedure insertar(v:vector;alu:integer;pos:integer);
	var
		i:indice;
	begin
		if(dimL<dimF)and ((pos>=1) and (pos<= dimL))then begin
			for i:=dimL downto pos do 
					v[i+1]:=v[i];
			v[i]:=alu;
			dimL:=dimL+1;
		end;
	end;
//c
procedure borrarpos(v:vector;dimL:integer;pos:integer);
	var
		i:integer;
	begin
		if(pos<=dimL)and(pos>=1)then begin
			for i:=pos to (dimL-1)  do 
				v[i]:=v[i+1];
			dimL:=dimL-1;
		end;
	end;	
//d
procedure borrarele(v:vector;dimL:integer;alu:integer);
	var 
		pos,i:integer
	begin
		i:=1;
		while(v[i]<>alu)and(i<=dimL)do
			i:=i+1;
		end;
		if(i>dimL)or(alu<>v[i])or (i<1)then writeln('No existe');
		else 
			for pos:=i+1 to dimL  do 
				v[pos-1]:=v[pos];
			dimL:=dimL-1;
	end;
//e
procedure inasistentes(var v:vector;var dimL:integer);
	var
		i:integer;
	begin
		for i:=1 to dimL do begin
			if(v[i].asist = 0)then begin
				borrarpos(v,dimL,i);
			i:=i+1;
			end;
		end;
	end
var
	nro,dimL,pos,pos1,alu,alu1:integer;
	v:vector;

begin
	readln(nro);
	posicion(v,nro,dimL);
	readln(pos);
	insertar(v,alu,pos);
	readln(pos1);
	borrarpos(v,dimL,pos1);
	readln(alu1);
	borrarele(v,dimL,alu1);
	inasistentes(v,dimL);
end;

