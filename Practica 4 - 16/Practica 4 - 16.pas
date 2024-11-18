{
Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.
}


program practica4_16;
const
	dimF=500;
type
	indice=1..dimF;
	vector=array[indice]of string;
procedure leer(v:vector;dimL:indice);
	var
		i:indice;
	begin
		readln(v[i]);
		while(i<=dimL)and(v[i]<>'ZZZ')do begin
			i:=i+1;
			readln(v[i]);
		end;
	end;
procedure borrar(v:vector;dimL:indice;x:string);
	var 
		pos:integer
		i:indice;
	begin
		while(v[i]<>x)and(i<=dimL)do
			i:=i+1;
		end;
		if(i>dimL)or(x<>v[i])or (i<1)then writeln('No existe');
		else 
			for pos:=i+1 to dimL  do 
				v[pos-1]:=v[pos];
			dimL:=dimL-1;
	end;
procedure insertar(v:vector;dimL:indice;pos:integer;x:string);
	var
		i:indice;
	begin
		if(dimL<dimF)and ((pos>=1) and (pos<= dimL))then begin
			for i:=dimL downto pos do 
					v[i+1]:=v[i];
			v[i]:=x;
			dimL:=dimL+1;
		end;
	end;
procedure insertarFina(v:vector;dimL:indice;x:string);
	var
		i:indice;
	begin
		if(dimL<dimF))then begin
			v[dimL+1]:=x;
			dimL:=dimL+1;
		end;
	end;

