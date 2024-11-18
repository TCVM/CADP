{
a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera ascendente.
}


program practica4_15;
const
	dimF=500;
type 
	indice=1..dimF;
	vector=array[1..dimF]of integer;
function Busqueda(v:vector;n:integer):boolean;
	var
		i:integer;
		esta:boolean;
	begin
		esta:=false;
		i:=1;
		while(i<=dimF and not(esta))do begin
			if(v[i]=n)then esta:=true;
			else i:=i + 1;
		end;
		A:=esta;
	end;
function BusquedaOrdena(v:vector;n:integer;var dimL:indice):boolean;
	var
		i:indice;
		esta:boolean;
	begin
		esta:=true;
		while(i<=dimL)and(n> v[i])do
			i:=i+1;
		if(i>dimL)or(n< v[i])then esta:=false;
		BusquedaOrdena:=esta;
	end;
var
dimL:indice;
BEGIN
	Busqueda(v,n);
	BusquedaOrdena(v,n,dimL);
END.

