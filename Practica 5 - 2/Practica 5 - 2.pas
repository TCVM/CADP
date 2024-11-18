{
Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
}


program practica5_2;
type
	cadena = string[9];
	producto = record
		codigo: integer;
		descripcion: cadena;
		precio: real;
	end;
	puntero_producto = ^producto;
var
	p: puntero_producto;
	prod: producto;
begin
	writeln(sizeof(p), ' bytes');
	writeln(sizeof(prod), ' bytes');
	new(p);
	writeln(sizeof(p), ' bytes');
	p^.codigo := 1;
	p^.descripcion := 'nuevo producto';
	writeln(sizeof(p^), ' bytes');
	p^.precio := 200;
	writeln(sizeof(p^), ' bytes');
	prod.codigo := 2;
	prod.descripcion := 'otro nuevo producto';
	writeln(sizeof(prod), ' bytes');
end.
{
4
16
4
16
16
16
(creo que estan mal hecho el codigo)
}
