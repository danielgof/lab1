program laba1;

uses Geometry;

var Tri:Triangle;
    L:line;
    Rec:Rectangle;
    A : array[1..20] of point;
    N , I: integer;

begin


  WriteLn('Triangle:');
  WriteLn('Point A: ');
  ReadLn(Tri.A.x, Tri.A.y);
  WriteLn('Point B: ');
  ReadLn(Tri.B.x, Tri.B.y);
  WriteLn('Point C: ');
  ReadLn(Tri.C.x, Tri.C.y);

  WriteLn('Line:');
  WriteLn('Point A: ');
  ReadLn(L.A.x, L.A.y);
  WriteLn('Point B: ');
  ReadLn(L.B.x, L.B.y);

  WriteLn('Rectangle: ');
  WriteLn('Point K: ');
  ReadLn(Rec.K.x, Rec.K.y);
  WriteLn('dlina CD: ');
  ReadLn(Rec.CD);
  WriteLn('dlina CE: ');
  ReadLn(Rec.CE);

  WriteLn('chislo tochek: ');
  ReadLn(N);

  for I:=1 to N do
  ReadLn(A[I].x, A[I].y);

  for I:=1 to N do
  if IsPointInsideOfRectangle(A[I], Rec) then
  WriteLn('pereseklo', I);



  WriteLn('AB = ', GetDistance(Tri.A, Tri.B):0:6);
  WriteLn('BC = ', GetDistance(Tri.B, Tri.C):0:6);
  WriteLn('AC = ', GetDistance(Tri.A, Tri.C):0:6);

  WriteLn('Per = ', GetTrPer(Tri):0:6);
  WriteLn('Sqr = ', GetTrSq(Tri):0:6);

   if CrOrNot (L,Tri) then
  WriteLn('pereseklo')
  else
  WriteLn('nepereseklo');

  ReadLn();

 end.
