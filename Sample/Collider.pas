{$OPTIMIZATION ON}
{$MACRO ON}
{$define Judge_YZ:=begin
                    y0:=p1[2]+(p2[2]-p1[2])*t;
                    z0:=p1[3]+(p2[3]-p1[3])*t;
                    if (-a.b/2<=y0)and(y0<=a.b/2)and(-a.c/2<=z0)and(z0<=a.c/2) then exit(true);
                   end;}
{$define Judge_XZ:=begin
                    x0:=p1[1]+(p2[1]-p1[1])*t;
                    z0:=p1[3]+(p2[3]-p1[3])*t;
                    if (-a.a/2<=x0)and(x0<=a.a/2)and(-a.c/2<=z0)and(z0<=a.c/2) then exit(true);
                   end;}
{$define Judge_YZ:=begin
                    x0:=p1[1]+(p2[1]-p1[1])*t;
                    y0:=p1[2]+(p2[2]-p1[2])*t;
                    if (-a.a/2<=y0)and(y0<=a.b/2)and(-a.c/2<=z0)and(z0<=a.c/2) then exit(true);
                   end;}
uses MatrixUnit,RandomUnit,StructUnit;
type
 Sphere=record p:Vector3; r:real end;
 Cuboid=record p,r:Vector3; a,b,c:real end;
 Capsule=record p,q:Vector3; r:real end;

procedure sw(var a,b:real);
var c:real; begin c:=a; a:=b; b:=c end;

function Collision(const a,b:Sphere):boolean;
begin
 exit(mold2(a.p-b.p)<=sqr(a.r+b.r))
end;

function Collision(const s,t:Capsule):boolean;
var a,b,c,d,e,k,sc,tc:real; w0,u,v:Vector3;
begin
 w0:=s.p-t.p; u:=s.q-s.p; v:=t.q-t.p;
 a:=dot_product(u,u);
 b:=dot_product(u,v);
 c:=dot_product(v,v);
 d:=dot_product(u,w0);
 e:=dot_product(v,w0);
 k:=a*c-b*b;
 if abs(b)<1e-7 then begin sc:=0; tc:=e/c end
                else begin sc:=(b*e-c*d)/k; tc:=(a*e-b*d)/k;
  if sc<0 then begin sc:=0; tc:=e/c end else
  if sc>1 then begin sc:=1; tc:=(e+b)/c end;
  if tc<0 then begin tc:=0; if -d  <0 then sc:=0 else if -d  >a then sc:=1 else sc:=-d    /a end else
  if tc>1 then begin tc:=1; if -d+b<0 then sc:=0 else if -d+b>a then sc:=1 else sc:=(-d+b)/a end
 end;
 exit(mold(w0+u*sc-v*tc)<=s.r+t.r)
end;

function Collision(a,b:Cuboid):boolean;
var
 p1,p2,p3,p4,p5,p6,p7,p8:Vector3;
 Rotatef:Matrix3;

 function RectTest(a,b,x1,y1,x2,y2:real):boolean;
 var l,r,t:real;
 begin
  if (-a/2<=x1)and(x1<=a/2)and(-b/2<=y1)and(y1<=b/2)and
     (-a/2<=x2)and(x2<=a/2)and(-b/2<=y2)and(y2<=b/2) then exit(true);
  if abs(x1-x2)<1e-7 then exit((-a/2<=x1)and(x1<=a/2)and((-b/2<=y1)and(y1<=b/2)or(-b/2<=y2)and(y2<=b/2)));
  if abs(y1-y2)<1e-7 then exit((-b/2<=y1)and(y1<=b/2)and((-a/2<=x1)and(x1<=a/2)or(-a/2<=x2)and(x2<=a/2)));
  if x1<=x2 then begin l:=x1; r:=x2 end
            else begin l:=x2; r:=x1 end;
  if (l<=-a/2)and(-a/2<=r) then begin t:=(y2-y1)*(-a/2-x1)/(x2-x1); if (-b/2<=t)and(t<=b/2) then exit(true) end;
  if (l<= a/2)and( a/2<=r) then begin t:=(y2-y1)*( a/2-x1)/(x2-x1); if (-b/2<=t)and(t<=b/2) then exit(true) end;
  if y1<=y2 then begin l:=y1; r:=y2 end
            else begin l:=y2; r:=y1 end;
  if (l<=-b/2)and(-b/2<=r) then begin t:=(x2-x1)*(-b/2-y1)/(y2-y1); if (-a/2<=t)and(t<=a/2) then exit(true) end;
  if (l<= b/2)and( b/2<=r) then begin t:=(x2-x1)*( b/2-y1)/(y2-y1); if (-a/2<=t)and(t<=a/2) then exit(true) end;
  exit(false)
 end;

 function BoxTest(const p1,p2:Vector3):boolean;
 var x0,y0,z0,l,r,t:real;
 begin
  if p1[1]<=p2[1] then begin l:=p1[1]; r:=p2[1] end
                  else begin l:=p2[1]; r:=p1[1] end;
  if (l<=a.a/2)and(a.a/2<=r) then
  if abs(r-l)<1e-7 then begin if (abs(l-a.a/2)<1e-7)and RectTest(a.b,a.c,p1[2],p1[3],p2[2],p2[3]) then exit(true) end
                   else begin t:=(a.a/2-p1[1])/(p2[1]-p1[1]); Judge_YZ end;
  if (l<=-a.a/2)and(-a.a/2<=r) then
  if abs(r-l)<1e-7 then begin if (abs(l+a.a/2)<1e-7)and RectTest(a.b,a.c,p1[2],p1[3],p2[2],p2[3]) then exit(true) end
                   else begin t:=(-a.a/2-p1[1])/(p2[1]-p1[1]); Judge_YZ end;
  if p1[2]<=p2[2] then begin l:=p1[2]; r:=p2[2] end
                  else begin l:=p2[2]; r:=p1[2] end;
  if (l<=a.b/2)and(a.b/2<=r) then
  if abs(r-l)<1e-7 then begin if (abs(l-a.b/2)<1e-7)and RectTest(a.a,a.c,p1[1],p1[3],p2[1],p2[3]) then exit(true) end
                   else begin t:=(a.b/2-p1[2])/(p2[2]-p1[2]); Judge_XZ end;
  if (l<=-a.b/2)and(-a.b/2<=r) then
  if abs(r-l)<1e-7 then begin if (abs(l+a.b/2)<1e-7)and RectTest(a.a,a.c,p1[1],p1[3],p2[1],p2[3]) then exit(true) end
                   else begin t:=(-a.b/2-p1[2])/(p2[2]-p1[2]); Judge_XZ end;
  if p1[3]<=p2[3] then begin l:=p1[3]; r:=p2[3] end
                  else begin l:=p2[3]; r:=p1[3] end;
  if (l<=a.c/2)and(a.c/2<=r) then
  if abs(r-l)<1e-7 then begin if (abs(l-a.c/2)<1e-7)and RectTest(a.a,a.b,p1[1],p1[2],p2[1],p2[2]) then exit(true) end
                   else begin t:=(a.c/2-p1[3])/(p2[3]-p1[3]); Judge_XZ end;
  if (l<=-a.c/2)and(-a.c/2<=r) then
  if abs(r-l)<1e-7 then begin if (abs(l+a.c/2)<1e-7)and RectTest(a.a,a.b,p1[1],p1[2],p2[1],p2[2]) then exit(true) end
                   else begin t:=(-a.c/2-p1[3])/(p2[3]-p1[3]); Judge_XZ end;
  exit(false)
 end;

begin
 b.p:=b.p-a.p; a.p:=Vec3_0;
 if sqrt(sqr(a.a)+sqr(a.b)+sqr(a.c))+sqrt(sqr(b.a)+sqr(b.b)+sqr(b.c))>=mold(b.p) then exit(false);
 b.p:=Rotate(Rotate(Rotate(b.p,Vec3_Z,-a.r[3]),Vec3_Y,-a.r[2]),Vec3_X,-a.r[1]);
 b.r:=b.r-a.r; a.r:=Vec3_0;
 p1:=Rotate(Rotate(Rotate(-b.p+Vec3(a.a/2,a.b/2,a.c/2),Vec3_Z,-b.r[3]),Vec3_Y,-b.r[2]),Vec3_X,-b.r[1]);
 if (-b.a/2<=p1[1])and(p1[1]<=b.a/2)and
    (-b.b/2<=p1[2])and(p1[2]<=b.b/2)and
    (-b.c/2<=p1[3])and(p1[3]<=b.c/2) then exit(true);
 Rotatef:=RotateZ(b.r[3])*RotateY(b.r[2])*RotateX(b.r[1]);
 p1:=Rotatef*Vec3(+b.a*0.5,+b.b*0.5,+b.c*0.5)+b.p;
 p2:=Rotatef*Vec3(+b.a*0.5,+b.b*0.5,-b.c*0.5)+b.p;
 p3:=Rotatef*Vec3(+b.a*0.5,-b.b*0.5,+b.c*0.5)+b.p;
 p4:=Rotatef*Vec3(+b.a*0.5,-b.b*0.5,-b.c*0.5)+b.p;
 p5:=Rotatef*Vec3(-b.a*0.5,+b.b*0.5,+b.c*0.5)+b.p;
 p6:=Rotatef*Vec3(-b.a*0.5,+b.b*0.5,-b.c*0.5)+b.p;
 p7:=Rotatef*Vec3(-b.a*0.5,-b.b*0.5,+b.c*0.5)+b.p;
 p8:=Rotatef*Vec3(-b.a*0.5,-b.b*0.5,-b.c*0.5)+b.p;
 if (-a.a/2<=p1[1])and(p1[1]<=a.a/2)and
    (-a.b/2<=p1[2])and(p1[2]<=a.b/2)and
    (-a.c/2<=p1[3])and(p1[3]<=a.c/2) then exit(true);
 exit(BoxTest(p1,p2)or
      BoxTest(p1,p3)or
      BoxTest(p1,p5)or
      BoxTest(p2,p4)or
      BoxTest(p2,p6)or
      BoxTest(p3,p4)or
      BoxTest(p3,p7)or
      BoxTest(p4,p8)or
      BoxTest(p5,p6)or
      BoxTest(p5,p7)or
      BoxTest(p6,p8)or
      BoxTest(p7,p8))
end;

{
  //Cuboid Test
var
 i:longint;
 a,b:Cuboid;
 t:Timer;
begin

 t.Start;
 for i:=1 to 1000000 do
 begin
  a.p:=Vec3(rnd(-10,10),rnd(-10,10),rnd(-10,10));
  a.r:=Vec3(rnd(-180,180),rnd(-180,180),rnd(-180,180));
  a.a:=rnd(-10,10);
  a.b:=rnd(-10,10);
  a.c:=rnd(-10,10);
  b.p:=Vec3(rnd(-10,10),rnd(-10,10),rnd(-10,10));
  b.r:=Vec3(rnd(-180,180),rnd(-180,180),rnd(-180,180));
  b.a:=rnd(-10,10);
  b.b:=rnd(-10,10);
  b.c:=rnd(-10,10);
  Collision(a,b);
 end;
 writeln('use time = ',t.Time,'ms');


end.
}

{
  //Capsule Test
var
 i:longint;
 a,b:Capsule;
begin
 a.p:=Vec3_0;
 a.q:=Vec3_X;
 a.r:=0.5;
 b.p:=Vec3(1,1,1);
 b.q:=Vec3(1,2,1);
 b.r:=0.6;
 write(Collision(a,b))
end.
}

begin
end.
