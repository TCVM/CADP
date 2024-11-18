{
Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de todos los 
dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android instalada, 
el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB). La información 
disponible se encuentra ordenada por versión de Android. Realizar un programa que procese la información 
disponible de todos los dispositivos e informe:
	a. La cantidad de dispositivos para cada versión de Android.
	b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
	c. El tamaño promedio de las pantallas de todos los dispositivos.
}


program practica6_12;
type
	celular=record
		ver:string;
		tam:real;
		ram:integer;
	end;
	listaC=^nodo;
	nodo=record
		dato:disp;
		sig:listaC;
	end;
	
procedure leerCelular(var c:celular);  //se dispone
procedure insertarOrdenado(var l:listaC; c:celular); //se dispone
procedure cargarCelulares(var l:listaC);//se dispone

procedure recorrer(l:listaC);
	var
		auxver:string;
		cant,cantver,cantb:integer;
		tamT,prom:real;
	begin
		tamT:=0;
		cant:=0;
		cantb:=0;
		while(l<>nil)do begin
			auxver:=l^.dato.ver;
			cantver:=0;
			while(l<>nil)and(l^.dato.ver=auxver)do begin
				cantver:=cantver+1;
				cantT:=cantT+1;
				tamT:=tamT+l^.dato.tam;
				if((l^.dato.ram>3)and(l^.dato.tam<=5))then cantb:=cantb+1;
				l:=l^.sig;
			end;
			writeln('Son ',cantver,' los dispositivos con version ',auxver);
		end;
		writeln('Son ',cantb,' los dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.');
		prom:=tamT/canT;
		writeln('El tamano promedio de las pantallas de todos los dispositivos es ',prom:2:3,' pulgadas');

	end;
var
l:listaC;
BEGIN
	recorrer(l);
END.

