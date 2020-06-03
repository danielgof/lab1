unit Geometry;

interface

  type
   Point = record
   x : Real;
   y : Real;
   end;
   line = record
   A : Point;
   B : Point;
   end;

   Rectangle = record
   K : Point;
   CD : real;
   CE : real;
   end;

   Triangle = record
   A : Point;
   B : Point;
   C : Point;
   end;

  function CreatePoint(const x : Real; const y : Real) : Point;

  function CreateRectangle(const K : point; const CD : line; const CE : line) : Rectangle;

  function IsPointInsideOfRectangle(const P: TPoint; const R: TRectangle): Boolean;

  function GetDistance(const l : Point; const r : Point) : Real;

  function GetTrPer(const T : Triangle) : Real;

  function GetTrSq(const T : Triangle) : Real;

  function CrLine(const L : line ; const p1, p2 : Point ) : Boolean;

  function CrOrNot(const L : line ;const T : Triangle) : Boolean;

  implementation

  function CreatePoint(const x : Real; const y : Real) : Point;
  begin
   CreatePoint.x := x;
   CreatePoint.y := y;
  end;

  function GetDistance(const l : Point; const r : Point) : Real;
   var vec : Point;
  begin
   vec.x := l.x - r.x;
   vec.y := l.y - r.y;
   GetDistance := sqrt(vec.x * vec.x + vec.y * vec.y);
  end;


  function CreateTriangle(const A : Point; const B : Point; const C : Point) : Triangle;
  begin
   CreateTriangle.A := A;
   CreateTriangle.B := B;
   CreateTriangle.C := C;
  end;


  procedure TrPerAndSide(const T : Triangle; out AB : Real; out BC : Real; out AC : Real; out Per : Real);
  begin
   AB := GetDistance(T.A, T.B);
   BC := GetDistance(T.B, T.C);
   AC := GetDistance(T.A, T.C);
   Per := GetTrPer(T);
  end;


  function GetTrPer(const T : Triangle) : Real;
  begin
   GetTrPer := GetDistance(T.A, T.B) + GetDistance(T.B, T.C) + GetDistance(T.A, T.C);
  end;

  function GetTrSq(const T : Triangle) : Real;
   var
   p : Real;
   AB, BC, AC : Real;
  begin
   TrPerAndSide(T, AB, BC, AC, p);
   p /= 2.0;
   GetTrSq := sqrt(p * (p - AB) * (p - BC) * (p - AC));
  end;

  function CrLine(const L : line ; const p1, p2 : Point ) : Boolean;
  var
    t : real;
  begin
   t := ((p1.x - l.A.x)*(l.A.y - l.B.y) - (p1.y - l.A.y)*(l.A.x - l.B.x)) / ((p1.x - p2.x)*(l.A.y-l.B.y) - (p1.y - p2.y)*(l.A.x - l.B.x));
   if (t <= 1) and (t >= 0) then
   exit(true)
   else
   exit(false);
  end;

  function CrOrNot(const L : line ;const T : Triangle) : Boolean;
    begin
      if CrLine (L , T.A , T.B ) then
      exit(true);
      if CrLine (L , T.B , T.C ) then
      exit(true);
      if CrLine (L , T.A , T.C ) then
      exit(true);
      exit(false);
    end;



  function IsPointInsideOfRectangle(const P: Point; const R: Rectangle): Boolean;
  var
    Cx : real;
    Cy : real;
    Fx : real;
    Fy : real;
  begin
       Cx := R.K.x - R.CE/2;
       Cy := R.K.y - R.CD/2;
       Fx := R.CE/2 + R.K.x;
       Fy := R.CD/2 + R.K.y;
       if (P.x => Cx) and (P.x <= Fx) and (P.y => Cy) and (P.y <= Fy) then
       exit (true)
       else
       exit (false);
  end;


  end.



