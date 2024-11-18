program alcance3;
var a: integer;
procedure uno;
var b: integer;
begin
b:= 2;
writeln(b);
end;
begin
a:= 1;
uno;
//B no esta declarada como global ni referenciada// 
writeln(a, b);
end.
