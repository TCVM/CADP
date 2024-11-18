{
La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a alumnos de la UNLP. Para ello, 
esta oficina cuenta con un registro detallado de todos los viajes realizados por una muestra de 1300 alumnos durante el mes de marzo. De 
cada viaje se conoce el código de alumno (entre 1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte 
(1. colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede
utilizar más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de datos apropiada. La lectura
finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
	a. La cantidad de alumnos que realizan más de 6 viajes por día
	b. La cantidad de alumnos que gastan en transporte más de $80 por día
	c. Los dos medios de transporte más utilizados.
	d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.
}


program program6_14;
const
	dimF=1300;
type
	scod=-1..1300;
	sdia=1..31;
	strans=1..5;
	viaje=record
		cod:scod;
		dmes:sdia;
		fac:string;
		trans:strans;
	end;
	
	lista=^nodo;
	nodo=record
		dato:viaje;
		sig:lista;
	end;
	vcod=array[1..dimF]of lista;
	vprecio=array[strans]of real;//dispuesta
	vtrans=array[strans]of integer;

procedure inivec(v:vtrans);
	var i:integer;
	begin
		for i:=1 to 5 do v[i]:=0;
	end;

procedure leer(vr:viaje);
	begin
		writeln('Codigo');
		readln(vr.cod);
		if(vr.cod<>-1)then begin
			writeln('Dia del mes');
			readln(vr.dmes);
			writeln('Facultad');
			readln(vr.fac);
			writeln('Transporte');
			readln(vr.trans);
		end;
	end;

procedure insertarOrdenado(var l:lista;vr:viajes);
	var
		nue,ant,act:lista;
	begin
		new(nue);
		nue^.dato:=vr;
		ant:=nil;
		act:=nil;
		while(act<>nil)and (act^.dato.dia<vr.dia)do begin
			ant:=act;
			act:=act^.sig;
		end;
		if(act=ant)then l:=nue
		else
			ant^.sig:=nue;
			nue^.sig:=act;
	end;
	
procedure inilistas(var v:vcod);
	var
		i:integer;
	begin
		for i:=1 to 1300 do
			v[i]:=nil;
	end;

procedure cargarlista(var vc:vcod);
	var
		vr:viaje;
	begin
		leer(vr);
		while(vr.cod<>-1)do begin
			insertarOrdenado(vc[vr.cod],vr);
			leer(vr);
		end;
	end;

procedure maxs(vt:vtrans;var max1,max2:strans);
	var
		i,cant1,cant2:integer;
	begin
		cant:=-1;
		cant2:=-1;
		for i:=1 to 5 do begin
			if(vt[i]>=cant1) then begin
				cant2:=cant1;
				max2:=max1;
				cant1:=vt[i];
				max1:=i;
			end;
			else if vt[i]>=cant2 then begin
				cant2:=t[i];
				max2:=i;
			end;
		end;
	end;


{	a. La cantidad de alumnos que realizan más de 6 viajes por día
	b. La cantidad de alumnos que gastan en transporte más de $80 por día
	c. Los dos medios de transporte más utilizados.
	d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

procedure procesar (vc:vcod; vp:vprecio); // la lista es a[i]
	var
		i,cantViajes,cantAlMas6Viajes,cantAl80pe,cantBiciOtro,cantViajesDia:integer;
		l:lista;
		diaAct:integer;
		viajo6,usoBici,usoNoBici,gasto80:boolean;
		gastoDia:real;
		vt:vtrans;
		max1,max2:strans;
	begin
		cantAlMas6Viajes:=0;
		cantAl80pe:=0;
		cantBiciOtro:=0;
		for i:=1 to dim do begin // recorre el vector de alumnos
			l:=vc[i];
			viajo6:=false;
			gasto80:=false;
			usoBici:=false;
			usoNoBici:=false;
			while l<>nil do begin //recorre la lista de viajes del alumno
				diaAct:= l^.viaje.dia;
				cantViajesDia:=0;
				gastoDia:=0;  
				while (l<>nil) and (l^.viaje.dia=diaAct) do begin 			//mientras sea el mismo dia
					cantViajesDia:=cantViajesDia + 1; 						//para la cantidad de alumnos que realizan más de 6 viajes por día
					gastoDia:= gastoDia + vp[l^.viaje.trans]; 				//se dispone de array con precio segun el transporte
					vt[l^.dato.trans]:= vt[l^.viaje.trans] +1; 			// suma para ver Los dos medios de transporte más utilizados.
					if (l^.dato.trans=5) then usoBici:=true 				//La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte
					else usoNoBici:=true;
					l:=l^.sig;
				end;
				if cantViajesDia>=6 then viajo6:=true;
				if gastoDia>80 then  gasto80:=true; // esta bien?? es por si no debe ser necesariamente todos los dias
			end;
			if viajo6 then cantAlMas6Viajes:= cantAlMas6Viajes +1; //para la cantidad de alumnos que realizan más de 6 viajes por día
			if usoBici and usoNoBici then cantBiciOtro:= cantBiciOtro +1;
			if gasto80 then cantAl80pe:=cantAl80pe+1;;

	end;
		maximos(vt,max1,max2);
		write(max1,max2);
		write(cantBiciOtro);
		write(cantAl80pe);
		write(cantAlMas6Viajes);
	end;
var
	vc:vcod;
	vp:vprecio;
BEGIN
	inicializarListas(vc); 
	cargarPrecios(vp); // se dispone
	cargar(vc);
	procesar(vc,vp);
END.
