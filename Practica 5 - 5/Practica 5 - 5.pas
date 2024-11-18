{
De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio.
}


program practica5_5;
Type
	TEmpleado = record
		sucursal: char;
		apellido: string[25];
		correoElectrónico: string[40];
		sueldo: real;
	end;
	Str50 = string[50];
Var
	alguien: TEmpleado;
	PtrEmpleado: ^TEmpleado;
Begin
	{Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
	Readln( alguien.apellido );//399.974
	{Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
	New( PtrEmpleado );//399.902
	{¿Cuánta memoria disponible hay ahora? (III)}
	Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
	Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );
	//399.902
	{¿Cuánta memoria disponible hay ahora? (IV)}
	Dispose( PtrEmpleado );
	//399.974
	{¿Cuánta memoria disponible hay ahora? (V)}
	//399.974
end.
