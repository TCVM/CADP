{
El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte 
de los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa 
y cantidad de días desde el último acceso.
	a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
	   revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso 
	   (orden ascendente).
	b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
	c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.
}


program program6_13;
type
	rango=1..4;
	user=record
	nombre:string;
	email:string;
	rol:rango;
	rev:string;
	cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:user;
		sig:lista;
	end;
	vector=array[rango]of integer;

procedure leer(var u:user);  //se dispone
procedure insertarOrdenado(var l:lista; u:user); //se dispone
procedure cargarlista(var l:lista);//se dispone

procedure inivec(var v:vector);
	var i:=integer;
	begin
		for i:=1 to 4 do v[i]:=0;
	end;
procedure max(l:lista;var max1,max2:string;var maxc1,maxc2:integer);
	begin
		if(l^.dato.cant>maxc1)then begin
		maxc2:=maxc1;
		maxc1:=l^.dato.cant;
		max2:=max1;
		max1:=l^.dato.email;
		end
		else if(l^.dato.cant>maxc2)then begin
			maxc2:=l^.dato.cant;
			max2:=l^.dato.email;
		end;
	end;
	
procedure	vecinf(v:vector);
	var i:=integer;
	begin
		for i:=1 to 4 do begin
			case i of
			1: writeln('Editor',v[i]);
			2: writeln('Autor',v[i]);
			3: writeln('Revisor',v[i]);
			4: writeln('Lector',v[i]);
		end;
	end;
procedure recorrer(l:lista;v:vector);
	var
		auxrev,max1,max2:string;
		maxc1,maxc2:integer
	begin
		while(l<>nil)do begin
			auxrev:=l^.dato.rev;
			while(l<>nil)and(auxrev=l^.dato.rev)do begin
				if(l^.dato.rev='Economica')then writeln(l^.dato.nombre,l^.dato.cant);
				v[l^.dato.rol]:=v[l^.dato.rol]+1;
				max(l,max1,max2,maxc1,maxc2);
				l:=l^.sig;	
			end;
		vecinf(v);
		end;
		writeln('emails de los dos usuarios que hace más tiempo que no ingresan al portal: 'max1,max2);
	end;
var

BEGIN
inivec(v);
recorrer(l,v);	
END.

