{
El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}


program practica4_11;
const
	dimF=2;
type
	fotos=record
		title:string;
		autor:string;
		likes:integer;
		clicks:integer;
		coments:integer;
	end;
	vector=array[1..dimF]of fotos;
procedure leer(var f:fotos);
	begin
		writeln('Titulo');
		readln(f.title);
		writeln('Autor');
		readln(f.autor);
		writeln('Likes');
		readln(f.likes);
		writeln('Clicks');
		readln(f.clicks);
		writeln('Comentarios');
		readln(f.coments);
	end;
procedure Max(v:vector;var max1:integer;var title1:string);
	var
		i:integer;
	begin
		for i:=1 to dimF do begin
			writeln('.');
			if(v[i].clicks>max1)then begin
				max1:=v[i].clicks;
				title1:=v[i].title;
			end;
		end;
	end;
function manitoarriba(v:vector):integer;
	var
		like,i:integer;
	begin
		like:=0;
		for i:=1 to dimF do begin
			if(v[i].autor='Art Vandelay')then like:=like+v[i].likes;
		end;
	manitoarriba:=like;
	end;
procedure Comentarios(v:vector);
	var
		i:integer;
	begin
		for i:=1 to dimF do begin
			writeln('Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa pagina: ',v[i].coments);
		end;
	end;
var 
	f:fotos;
	v:vector;
	i,max1:integer;
	title1:string;
BEGIN
	max1:=0;
	for i:=1 to dimF do begin
		leer(f);
		v[i]:=f;
	end;
	Max(v,max1,title1);
	Comentarios(v);
	writeln('Titulo de la foto mas vista: ',title1);
	writeln('Me gusta recibidos por fotos de el fotografo Art Vandelay: ',manitoarriba(v));
END.

