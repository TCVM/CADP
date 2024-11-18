{
Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
}

program practica5_1;
type
	cadena = string[50];//LA LONGITUD DEL STRING ES EL TYPE
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	writeln(sizeof(pc), ' bytes');
	new(pc);
	writeln(sizeof(pc), ' bytes');
	pc^:= 'un nuevo nombre';
	writeln(sizeof(pc), ' bytes');
	writeln(sizeof(pc^), ' bytes');
	pc^:= 'otro nuevo nombre distinto al anterior';
	writeln(sizeof(pc^), ' bytes');
end.

{
4
4
4
16
40
}
