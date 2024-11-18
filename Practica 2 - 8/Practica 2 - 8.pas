program anidamientos;
	procedure leer(ok:boolean);
	var
		letra : char;
		function analizarLetra:boolean;
			begin
				if (letra >= 'a') and (letra <= 'z') then
					analizarLetra := true
				else
					if (letra >= 'A') and (letra <= 'Z') then
						analizarletra := false
					else
						writeln('valores no soportados, a dormi pa');
			end; { fin de la funcion analizarLetra }
	begin
		readln(letra);
		if (analizarLetra) then
			writeln('Se trata de una minúscula')
		else
			writeln('Se trata de una mayúscula');
	ok := analizarLetra;
	end; { fin del procedure leer}
var
	ok : boolean;
begin { programa principal }
	leer(ok);//Lo logre, casi me muero
	//ok := analizarLetra(ok);//FUNCION NO ENCONTRADA POR SER PARTE DE PROCESO LUL
	if ok then
		writeln('Gracias, vuelva prontosss');
end.
