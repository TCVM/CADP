{
La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más grandes 
del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del monotributo (entre la A y la F), 
el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y el monto mensual acordado en el contrato. La 
información se ingresa ordenada por fecha de firma de contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector. Una vez almacenados 
los datos, procesar dicha estructura para obtener:
	1) Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
	2) Cantidad de clientes para cada categoría de monotributo
	3) Código de las 10 ciudades con mayor cantidad de clientes
	4) Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.
}


program practica4_19;
const
	dimF=500;
type
	categoria='A'...'F';
	codciudad=1..2400;
	fechar=record
		dia=integer;
		mes=integer;
		anio=integer;
	end;
	client=record
		fecha:fechaR;
		tributo:categoria;
		cod:codciudad;
		monto:real;
	end;
	ciudadR=record
	cod:integer;
	clientes:integer;
	end;
Cvector=array[1..dimF]of client;
CRvector=array[codciudad]of ciudadR;
CAvector=array[categoria]of integer;	

procedure leer(var cl:cliente);
	begin
		writeln('fecha');
		read(cl.fecha.dia);readln(cl.fecha.mes);readln(cl.fecha.anio);
		writeln('Categoria');
		read(cl.tributo);
		writeln('codigo');
		read(cl.cod);
		writeln('monto');
		read(cl.monto);
	end;

procedure cargar (var c:Cvector);
	var
		i:integer;
	begin
		for i:=1 to dim do
			leer(c[i]);
	end;
procedure maxcontr(anio,contr:integer;var maxanio,maxcontr:integer);
	begin
		if contr>=maxcontr then begin
			maxcontr:=contr;
			maxanio:=anio;
			end;
	end;
procedure incializarcategoria(ca:CAvector);
	var
		i:char;
	begin
		for i:='A' to 'F' do
			c[i]:=0;
	end;
procedure imprimirCat(ca:CAvector);
	var	
		i:char;
	begin
		for i:='A' to 'F' do
			writeln('La categoria ',i,' tiene ',ca[i],' clientes');
	end;
procedure inicializarCiudades(var cr:CRvector);
	var
		i:integer;
	begin
		for i:=1 to 2400 do begin
			cr[i].clientes:=0;
			cr[i].cod:=i;
		end;
	end;
procedure ordenar(var cr:CRvector);
	var
	i,j,k,x:integer;
	begin
	for i:= 1 to 2400 - 1 do begin
		k:= i;
		for j:= i+1 to 2400 do
			if cr[j].clientes > cr[k].clientes then
				k:= j;
		x:= cr[k];
		cr[k]:= cr[i];
		cr[i]:= x;
	end:
end;
procedure imprimirMaxCiudades(var cr:CRvector);
	var 
		i:integer;
	begin
		for i:=1 to 10 do
			writeln(i,' La ciudad codigo',cr[i].codigo,'tiene ',cr[i].cantClientes,' clientes');	
	end;
function promedio(suma:real;cant:integer):real;
	begin
		promedio:=suma/cant;
	end;	
procedure Clientup(c:Cvector;suma:real):integer;
	var
		i,cant:integer;
		prom:real;
	begin
		prom:=promedio(suma,dimF);
		cant:=0;
		for i:=1 to dimF do
		  if(cr[i].monto>prom)then
			cant:=cant+1;
		Clientup:=cant;
	end;
var
	c:Cvector;
	cr:CRvector;
	ca:CAvector;
	i,maxanio,maxcontr,mesactual,anioactual,cantanio,cantmes:integer;
	suma:real;
BEGIN
	cargar(c);
	maxcontr:=-1;
	suma:=0;
	incializarcategoria(ca);
	inicializarCiudades(cr);
	i:=1;
	while i<=dimF do begin
		anioactual:=c[i].fecha.anio;
		cantanio:=0;
	  while (i<=dimF) and (anioactual=c[i].fecha.anio) do begin
			mesactual:=c[i].fecha.mes;
			cantMes:=0; //Cantidad de contratos por cada mes	
		while (i<=dimF) and (anioActual=c[i].fecha.ano)and(mesacutal=c[i],fecha.mes)do begin
			cantmes:=cantmes+1;
			cantanio:=cantanio+1;
			cr[c[i].cod].clientes:=cr[c[i].cod].clientes+1;
			ca[c[i].categoria]:=ca[c[i].tributo]+1;
			suma:=suma+c[i].monto;
			i:=i+1:
		end;
		writeln('La cantidad de contratos del mes ',mesactual,' es de: ',cantmes);
	  end;
		writeln('La cantidad de contratos del ano ',anoactual,' es de: ',cantano);
		max(anoactual,cantano,maxanio,maxcontr);
	end;
	ordenar(cr);
	imprimirMaxCiudades(cr);
	imprimirCat(ca);
	writeln('El año que se firmo la mayor cantidad de contratos es en ',maxano,' con ',maxcontr,' contratos.');
	writeln('Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes: ',Clientup(c;suma));
END.

