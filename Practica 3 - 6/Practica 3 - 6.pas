{
 Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.
}


program practica3_6;
type 
		informacion=record
		linea:string;
		Cores:integer;
		Clock:real;
		nanos:integer;
	end;
		microprocesador=record
			marca:string;
			cant:integer;
			info:informacion;
		end;
		
procedure datos(var info:informacion);
	begin
		writeln('Linea');
		readln(info.linea);
		writeln('Cantidad de cores');
		readln(info.Cores);
		writeln('Velocidad de reloj');
		readln(info.Clock);
		writeln('Transistores');
		readln(info.nanos);			
	end;
procedure Micropro(var micro:microprocesador);
	begin
		writeln('Marca');
		readln(micro.marca);
	end;
	
procedure Transistor(micro:microprocesador;var lista:string);
	begin
			if((micro.info.Cores<>0)and(micro.info.nanos<22))then begin
			lista+= micro.marca;
			lista+= ' ';
			lista+= micro.info.linea;
			lista+=', ';
			end;
	end;
procedure best(micro:microprocesador;var MTran1,MTran2:integer;var MMarc1,MMarc2:string);
		begin
			if(micro.cant>MTran1)then begin
				MTran2:=MTran1;
				MTran1:=micro.cant;
				MMarc2:=MMarc1;
				MMarc1:=micro.marca;
			end
			else if(micro.cant > MTran2)then begin
				MTran2:=micro.cant;
				MMarc2:=micro.marca;
			end;
		end;
 procedure multi(micro:microprocesador;var cant:integer);
	begin
		if((micro.info.Cores > 1 ) and (micro.info.Clock >= 2 ) and ((micro.marca= 'AMD' ) or (micro.marca= 'Intel' )))then cant:=cant + 1;
	end;
var
	micro:microprocesador;
	cant,MTran1,MTran2:integer;
	lista,MMarc1,MMarc2:string;
BEGIN
	MTran1:=-1;
	MTran2:=-1;
	micro.cant:=0;
	lista:= ' ';
	MMarc1:=' ';
	MMarc2:=' ';
	micropro(micro);
	while(micro.marca <> '0')do begin
		datos(micro.info);
		micro.cant:=0;
		while(micro.info.Cores <> 0)do begin
			if(micro.info.nanos=14)then micro.cant:=micro.cant+1;	
			Transistor(micro,lista);
			best(micro,MTran1,MTran2,MMarc1,MMarc2);
			multi(micro,cant);
			datos(micro.info);
		end;
	micro.cant:=0;
	micropro(micro);
	end;
	writeln('Todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm: ',lista);
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm: ',MTran1,', ',MMarc1,' y ',MTran2,', ',MMarc2);
	writeln('Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz: ',cant);
END.

