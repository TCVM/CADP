{
Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones. 
}


program practica4_6;
const
	dimF=100;
type
	vector=array[1..dimF]of integer;
	
procedure MaximoMinimo(v:vector;var Maximo,Minimo:integer);
	var i,max,min,posmax,posmin:integer;
	begin
		i:=0;
		max:=0;
		min:=100;
		posmax:=0;
		posmin:=0;
		for	i:=1 to dimF do begin
			if(max<v[i])then begin
				max:=v[i];
				posmax:=i;
			end
			else
				if(min>v[i])then begin
					min:=v[i];
					posmin:=i;
				end;
		end;
		Maximo:=posmax;
		Minimo:=posmin;
	end;

var 
v:vector;
Maximo,Minimo:integer;
BEGIN
	MaximoMinimo(v,Maximo,Minimo);
	
END.

