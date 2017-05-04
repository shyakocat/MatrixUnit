unit MatrixUnit;

interface

uses math;
type
 preal=^real;
 Vector2=array[1..2]of real;
 Matrix2=array[1..2,1..2]of real;
 Vector3=array[1..3]of real;
 Matrix3=array[1..3,1..3]of real;
 Quaternion=record x,y,z,w:real end; //xi+yj+zk+w
 Vector=record n:longint; A:array of real end;
 Matrix=record n,m:longint; A:array of array of real end;
const
 Vec2_0:Vector2=(0,0);
 Vec3_0:Vector3=(0,0,0);
 Vec3_X:Vector3=(1,0,0);
 Vec3_Y:Vector3=(0,1,0);
 Vec3_Z:Vector3=(0,0,1);
 Mat2_I:Matrix2=((1,0),(0,1));
 Mat2_0:Matrix2=((0,0),(0,0));
 Mat3_I:Matrix3=((1,0,0),(0,1,0),(0,0,1));
 Mat3_0:Matrix3=((0,0,0),(0,0,0),(0,0,0));
 Quaternion_0:Quaternion=(x:0;y:0;z:0;w:1);

function Vec2(const a1,a2:real):Vector2;
function Mat2(const a11,a12,a21,a22:real):Matrix2;
operator =(const a,b:Vector2)c:boolean;
operator +(const a,b:Vector2)c:Vector2;
operator -(const a,b:Vector2)c:Vector2;
operator -(const a:Vector2)c:Vector2;
operator *(const a:Vector2;const t:real)c:Vector2;
operator /(const a:Vector2;const t:real)c:Vector2;
function dot_product(const a,b:Vector2):real;
function cross_product(const a,b:Vector2):real;
operator =(const a,b:Matrix2)c:boolean;
operator *(const b:Matrix2;const a:Vector2)c:Vector2;
operator *(const a,b:Matrix2)c:Matrix2;
operator *(const a:Matrix2;const t:real)c:Matrix2;
operator /(const a:Matrix2;const t:real)c:Matrix2;
function det(const a:Matrix2):real;
function Transpose(const a:Matrix2):Matrix2;
function Adjugate(const a:Matrix2):Matrix2;
function Inverse(const a:Matrix2):Matrix2;
procedure Scanf(var a:Vector2);
procedure Scanf(var a:Matrix2);
procedure Printf(const a:Vector2);
procedure PrintfLn(const a:Vector2);
procedure Printf(const a:Matrix2);

function Vec3(const a1,a2,a3:real):Vector3;
function Mat3(const a11,a12,a13,a21,a22,a23,a31,a32,a33:real):Matrix3;
function mold(const a:Vector3):real;
function mold2(const a:Vector3):real;
function normalize(const a:Vector3):Vector3;
operator =(const a,b:Vector3)c:boolean;
operator +(const a,b:Vector3)c:Vector3;
operator -(const a,b:Vector3)c:Vector3;
operator -(const a:Vector3)c:Vector3;
operator *(const a:Vector3;const t:real)c:Vector3;
operator /(const a:Vector3;const t:real)c:Vector3;
function dot_product(const a,b:Vector3):real;
operator =(const a,b:Matrix3)c:boolean;
operator *(const b:Matrix3;const a:Vector3)c:Vector3;
operator *(const a,b:Matrix3)c:Matrix3;
operator *(const a:Matrix3;const t:real)c:Matrix3;
operator /(const a:Matrix3;const t:real)c:Matrix3;
function det(const a:Matrix3):real;
function cofactor(const a:Matrix3;i,j:longint):Matrix2;
function Transpose(const a:Matrix3):Matrix3;
function Adjugate(const a:Matrix3):Matrix3;
function Inverse(const a:Matrix3):Matrix3;
procedure Scanf(var a:Vector3);
procedure Scanf(var a:Matrix3);
procedure Printf(const a:Vector3);
procedure PrintfLn(const a:Vector3);
procedure Printf(const a:Matrix3);
function RotateZ(a:real):Matrix3;
function RotateX(a:real):Matrix3;
function RotateY(a:real):Matrix3;
function RotateAxis(const s:Vector3;const a:real):Matrix3;
function RotateMMD(const R:Vector3):Matrix3;

operator +(const a,b:Quaternion)c:Quaternion;
operator -(const a,b:Quaternion)c:Quaternion;
operator -(const a:Quaternion)c:Quaternion;
operator *(const a:Quaternion;const t:real)c:Quaternion;
operator /(const a:Quaternion;const t:real)c:Quaternion;
operator *(const a,b:Quaternion)c:Quaternion;
function Quaternion_N(const a:Quaternion):real;
function Quaternion_Normalize(const a:Quaternion):Quaternion;
function conjugate(a:Quaternion):Quaternion;
function inverse(const a:Quaternion):Quaternion;
function Quaternion_Point(const a:Vector3):Quaternion;
function Quaternion_Rotate(a:Vector3;t:real):Quaternion;
function Rotate(const a,b:Vector3;const t:real):Vector3;
procedure Scanf(var a:Quaternion);
procedure Printf(const a:Quaternion);
procedure PrintfLn(const a:Quaternion);

function Vec(a:preal;n:longint):Vector;
function Mat(a:preal;n,m:longint):Matrix;
operator =(const a,b:Vector)c:boolean;
operator =(const a,b:Matrix)c:boolean;
operator +(const a,b:Vector)c:Vector;
operator -(const a,b:Vector)c:Vector;
operator *(const a,b:Matrix)c:Matrix;
operator *(const a:Matrix;const b:Vector)c:Vector;
operator *(const a:Vector;const b:Matrix)c:Vector;
procedure Scanf(var a:Vector;n:longint);
procedure Scanf(var a:Matrix;n,m:longint);
procedure Printf(const a:Vector);
procedure Printf(const a:Matrix);



implementation

function Vec2(const a1,a2:real):Vector2;
 var c:Vector2; begin c[1]:=a1; c[2]:=a2; exit(c) end;
function Mat2(const a11,a12,a21,a22:real):Matrix2;
 var c:Matrix2; begin c[1,1]:=a11; c[1,2]:=a12; c[2,1]:=a21; c[2,2]:=a22; exit(c) end;
operator =(const a,b:Vector2)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])) end;
operator +(const a,b:Vector2)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]+b[i] end;
operator -(const a,b:Vector2)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]-b[i] end;
operator -(const a:Vector2)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=-a[i] end;
operator *(const a:Vector2;const t:real)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]*t end;
operator /(const a:Vector2;const t:real)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]/t end;
function dot_product(const a,b:Vector2):real;
 begin exit(a[1]*b[1]+a[2]*b[2]) end;
function cross_product(const a,b:Vector2):real;
 begin exit(a[1]*b[2]-a[2]*b[1]) end;
operator =(const a,b:Matrix2)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])) end;
operator *(const b:Matrix2;const a:Vector2)c:Vector2;
 begin c[1]:=b[1,1]*a[1]+b[1,2]*a[2];
       c[2]:=b[2,1]*a[1]+b[2,2]*a[2] end;
operator *(const a,b:Matrix2)c:Matrix2;
 var i,j,k:smallint; begin fillchar(c,sizeof(c),0);
                           for i:=1 to 2 do
                           for j:=1 to 2 do
                           for k:=1 to 2 do c[i,j]:=c[i,j]+a[i,k]*b[k,j] end;
operator *(const a:Matrix2;const t:real)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=a[i,j]*t end;
operator /(const a:Matrix2;const t:real)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=a[i,j]/t end;
function det(const a:Matrix2):real;
 begin exit(a[1,1]*a[2,2]-a[1,2]*a[2,1]) end;
function Transpose(const a:Matrix2):Matrix2;
 var i,j:smallint; z:Matrix2; begin for i:=1 to 2 do
                                    for j:=1 to 2 do z[i,j]:=a[j,i]; exit(z) end;
function Adjugate(const a:Matrix2):Matrix2;
 var i,j:smallint; z,y:Matrix2;
 begin y:=Transpose(a); for i:=1 to 2 do
                        for j:=1 to 2 do z[i,j]:=y[3-i,3-j]*(1-(i+j)and 1<<1);
       exit(z) end;
function Inverse(const a:Matrix2):Matrix2;
 var d:real; begin d:=det(a); if d=0 then exit(Mat2_0); exit(Adjugate(a)/d) end;
procedure Scanf(var a:Vector2);
 begin read(a[1],a[2]) end;
procedure Scanf(var a:Matrix2);
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do read(a[i,j]) end;
procedure Printf(const a:Vector2);
 begin write('(',a[1]+1e-7:10:6,',',a[2]+1e-7:10:6,')') end;
procedure PrintfLn(const a:Vector2);
 begin Printf(a); writeln end;
procedure Printf(const a:Matrix2);
 begin PrintfLn(a[1]); PrintfLn(a[2]) end;


function Vec3(const a1,a2,a3:real):Vector3;
 var c:Vector3; begin c[1]:=a1; c[2]:=a2; c[3]:=a3; exit(c) end;
function Mat3(const a11,a12,a13,a21,a22,a23,a31,a32,a33:real):Matrix3;
 var c:Matrix3; begin c[1,1]:=a11; c[1,2]:=a12; c[1,3]:=a13;
                      c[2,1]:=a21; c[2,2]:=a22; c[2,3]:=a23;
                      c[3,1]:=a31; c[3,2]:=a32; c[3,3]:=a33; exit(c) end;
function mold(const a:Vector3):real;
 begin exit(sqrt(sqr(a[1])+sqr(a[2])+sqr(a[3]))) end;
function mold2(const a:Vector3):real;
 begin exit(sqr(a[1])+sqr(a[2])+sqr(a[3])) end;
function normalize(const a:Vector3):Vector3;
 var t:real; c:Vector3; begin t:=Mold(a); c[1]:=a[1]/t; c[2]:=a[2]/t; c[3]:=a[3]/t; exit(c) end;
operator =(const a,b:Vector3)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])and(a[3]=b[3])) end;
operator +(const a,b:Vector3)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]+b[i] end;
operator -(const a,b:Vector3)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]-b[i] end;
operator -(const a:Vector3)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=-a[i] end;
operator *(const a:Vector3;const t:real)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]*t end;
operator /(const a:Vector3;const t:real)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]/t end;
function dot_product(const a,b:Vector3):real;
 begin exit(a[1]*b[1]+a[2]*b[2]+a[3]*b[3]) end;
operator =(const a,b:Matrix3)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])and(a[3]=b[3])) end;
operator *(const b:Matrix3;const a:Vector3)c:Vector3;
 var i,k:smallint; begin fillchar(c,sizeof(c),0);
                         for i:=1 to 3 do
                         for k:=1 to 3 do c[i]:=c[i]+b[i,k]*a[k] end;
operator *(const a,b:Matrix3)c:Matrix3;
 var i,j,k:smallint; begin fillchar(c,sizeof(c),0);
                           for i:=1 to 3 do
                           for j:=1 to 3 do
                           for k:=1 to 3 do c[i,j]:=c[i,j]+a[i,k]*b[k,j] end;
operator *(const a:Matrix3;const t:real)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=a[i,j]*t end;
operator /(const a:Matrix3;const t:real)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=a[i,j]/t end;
function det(const a:Matrix3):real;
 begin exit(a[1,1]*(a[2,2]*a[3,3]-a[2,3]*a[3,2])
           -a[1,2]*(a[2,1]*a[3,3]-a[2,3]*a[3,1])
           +a[1,3]*(a[2,1]*a[3,2]-a[2,2]*a[3,1])) end;
function cofactor(const a:Matrix3;i,j:longint):Matrix2;
 var x,y:smallint; z:Matrix2; begin for x:=1 to i-1 do
                                    for y:=1 to j-1 do z[x,y]:=a[x,y];
                                    for x:=i to   2 do
                                    for y:=1 to j-1 do z[x,y]:=a[x+1,y];
                                    for x:=1 to i-1 do
                                    for y:=j to   2 do z[x,y]:=a[x,y+1];
                                    for x:=i to   2 do
                                    for y:=j to   2 do z[x,y]:=a[x+1,y+1]; exit(z) end;
function Transpose(const a:Matrix3):Matrix3;
 var i,j:smallint; z:Matrix3; begin for i:=1 to 3 do
                                    for j:=1 to 3 do z[i,j]:=a[j,i]; exit(z) end;
function Adjugate(const a:Matrix3):Matrix3;
 var i,j:smallint; z,y:Matrix3;
 begin y:=Transpose(a); for i:=1 to 3 do
                        for j:=1 to 3 do z[i,j]:=det(cofactor(y,i,j))*(1-(i+j)and 1<<1);
       exit(z) end;
function Inverse(const a:Matrix3):Matrix3;
 var d:real; begin d:=det(a); if d=0 then exit(Mat3_0); exit(Adjugate(a)/d) end;
procedure Scanf(var a:Vector3);
 begin read(a[1],a[2],a[3]) end;
procedure Scanf(var a:Matrix3);
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do read(a[i,j]) end;
procedure Printf(const a:Vector3);
 begin write('(',a[1]+1e-7:10:6,',',a[2]+1e-7:10:6,',',a[3]+1e-7:10:6,')') end;
procedure PrintfLn(const a:Vector3);
 begin Printf(a); writeln end;
procedure Printf(const a:Matrix3);
 var i:smallint; begin for i:=1 to 3 do PrintfLn(a[i]) end;


function RotateZ(a:real):Matrix3;
 var c:Matrix3; _sin,_cos:real; begin a:=a*pi/180; _sin:=sin(a); _cos:=cos(a);
                                      c[1,1]:= _cos; c[1,2]:=_sin; c[1,3]:=0;
                                      c[2,1]:=-_sin; c[2,2]:=_cos; c[2,3]:=0;
                                      c[3,1]:=0;     c[3,2]:=0;    c[3,3]:=1; exit(c) end;
function RotateX(a:real):Matrix3;
 var c:Matrix3; _sin,_cos:real; begin a:=a*pi/180; _sin:=sin(a); _cos:=cos(a);
                                      c[1,1]:=1; c[1,2]:=0;     c[1,3]:=0;
                                      c[2,1]:=0; c[2,2]:= _cos; c[2,3]:=_sin;
                                      c[3,1]:=0; c[3,2]:=-_sin; c[3,3]:=_cos; exit(c) end;
function RotateY(a:real):Matrix3;
 var c:Matrix3; _sin,_cos:real; begin a:=a*pi/180; _sin:=sin(a); _cos:=cos(a);
                                      c[1,1]:=_cos; c[1,2]:=0; c[1,3]:=-_sin;
                                      c[2,1]:=0;    c[2,2]:=1; c[2,3]:=0;
                                      c[3,1]:=_sin; c[3,2]:=0; c[3,3]:=_cos; exit(c) end;
function RotateAxis(const s:Vector3;const a:real):Matrix3;
 var u,v:real; begin if sqr(s[1])+sqr(s[3])<1e-7 then exit(RotateY(a));
                     u:=arccos(s[3]/sqrt(sqr(s[1])+sqr(s[3])))*180/pi;
                     v:=arcsin(s[2]/sqrt(sqr(s[1])+sqr(s[2])+sqr(s[3])))*180/pi;
                     exit(RotateY(-u)*RotateX(v)*RotateZ(a)*RotateX(-v)*RotateY(u)) end;
function RotateMMD(const R:Vector3):Matrix3;
 var a,b,c:Vector3; e,f:Matrix3; begin a:=Vec3(1,0,0); b:=Vec3(0,1,0); c:=Vec3(0,0,1); f:=Mat3_I;
                                       e:=RotateAxis(b, R[2]); a:=e*a; c:=e*c; f:=e*f;
                                       e:=RotateAxis(a,-R[1]); b:=e*b; c:=e*c; f:=e*f;
                                       e:=RotateAxis(c,-R[3]); a:=e*a; b:=e*b; f:=e*f; exit(f) end;

operator +(const a,b:Quaternion)c:Quaternion;
 begin c.x:=a.x+b.x; c.y:=a.y+b.y; c.z:=a.z+b.z; c.w:=a.w+b.w end;
operator -(const a,b:Quaternion)c:Quaternion;
 begin c.x:=a.x-b.x; c.y:=a.y-b.y; c.z:=a.z-b.z; c.w:=a.w-b.w end;
operator -(const a:Quaternion)c:Quaternion;
 begin c.x:=-a.x; c.y:=-a.y; c.z:=-a.z; c.w:=-a.w end;
operator *(const a:Quaternion;const t:real)c:Quaternion;
 begin c.x:=a.x*t; c.y:=a.y*t; c.z:=a.z*t; c.w:=a.w*t end;
operator /(const a:Quaternion;const t:real)c:Quaternion;
 begin c.x:=a.x/t; c.y:=a.y/t; c.z:=a.z/t; c.w:=a.w/t end;
operator *(const a,b:Quaternion)c:Quaternion;
 begin c.x:=+a.x*b.w-a.y*b.z+a.z*b.y+a.w*b.x;
       c.y:=+a.x*b.z+a.y*b.w-a.z*b.x+a.w*b.y;
       c.z:=-a.x*b.y+a.y*b.x+a.z*b.w+a.w*b.z;
       c.w:=-a.x*b.x-a.y*b.y-a.z*b.z+a.w*b.w end;
function Quaternion_N(const a:Quaternion):real;
 begin exit(sqrt(sqr(a.x)+sqr(a.y)+sqr(a.z)+sqr(a.w))) end;
function Quaternion_Normalize(const a:Quaternion):Quaternion;
 begin exit(a/Quaternion_N(a)) end;
function conjugate(a:Quaternion):Quaternion;
 begin a.x:=-a.x; a.y:=-a.y; a.z:=-a.z; exit(a) end;
function inverse(const a:Quaternion):Quaternion;
 begin exit(conjugate(a)/(sqr(a.x)+sqr(a.y)+sqr(a.z)+sqr(a.w))) end;
function Quaternion_Point(const a:Vector3):Quaternion;
 begin with Quaternion_Point do begin x:=a[1]; y:=a[2]; z:=a[3]; w:=0 end end;
function Quaternion_Rotate(a:Vector3;t:real):Quaternion;
 var _sin,_cos:real; c:Quaternion; begin t:=t*pi/360; _sin:=sin(t); _cos:=cos(t); a:=normalize(a);
 with c do begin w:=_cos; x:=a[1]*_sin; y:=a[2]*_sin; z:=a[3]*_sin end; exit(c) end;
function Rotate(const a,b:Vector3;const t:real):Vector3;
 var p,q:Quaternion; begin p:=Quaternion_Point(a); q:=Quaternion_Rotate(b,t);
                           with q*p*inverse(q) do begin Rotate[1]:=x; Rotate[2]:=y; Rotate[3]:=z end end;
procedure Scanf(var a:Quaternion);
 begin with a do read(x,y,z,w) end;
procedure Printf(const a:Quaternion);
 begin write('(x=',a.x+1e-7:10:6,',y=',a.y+1e-7:10:6,',z=',a.z+1e-7:10:6,',w=',a.w+1e-7:10:6,')') end;
procedure PrintfLn(const a:Quaternion);
 begin Printf(a); writeln end;


function Vec(a:preal;n:longint):Vector;
 var i:longint; c:Vector; begin c.n:=n; setlength(c.a,n);
                                for i:=0 to n-1 do c.a[i]:=a[i] end;
function Mat(a:preal;n,m:longint):Matrix;
 var i,j:longint; c:Matrix; begin c.n:=n; c.m:=m; setlength(c.a,n,m);
                                  for i:=0 to n-1 do
                                  for j:=0 to m-1 do c.a[i,j]:=a[i*m+j] end;
operator =(const a,b:Vector)c:boolean;
 var i:longint; begin if a.n<>b.n then exit(false);
                      for i:=0 to a.n-1 do if a.a[i]<>b.a[i] then exit(false); exit(true) end;
operator =(const a,b:Matrix)c:boolean;
 var i,j:longint; begin if (a.n<>b.n)or(a.m<>b.m) then exit(false);
                        for i:=0 to a.n-1 do
                        for j:=0 to a.m-1 do if a.a[i,j]<>b.a[i,j] then exit(false); exit(true) end;
operator +(const a,b:Vector)c:Vector;
 var i:longint; begin if a.n<>b.n then halt(201); c.n:=a.n; setlength(c.a,c.n);
                      for i:=0 to c.n-1 do c.a[i]:=a.a[i]+b.a[i] end;
operator -(const a,b:Vector)c:Vector;
 var i:longint; begin if a.n<>b.n then halt(201); c.n:=a.n; setlength(c.a,c.n);
                      for i:=0 to c.n-1 do c.a[i]:=a.a[i]-b.a[i] end;
operator *(const a,b:Matrix)c:Matrix;
 var i,j,k:longint; begin if a.m<>b.n then halt(201); c.n:=a.n; c.m:=b.m; setlength(c.a,c.n,c.m);
                          for i:=0 to c.n-1 do
                          for j:=0 to c.m-1 do begin c.a[i,j]:=0;
                          for k:=0 to a.m-1 do c.a[i,j]:=c.a[i,j]+a.a[i,k]*b.a[k,j] end end;
operator *(const a:Matrix;const b:Vector)c:Vector;
 var i,k:longint; begin if a.m<>b.n then halt(201); c.n:=a.n; setlength(c.a,c.n);
                        for i:=0 to c.n-1 do begin c.a[i]:=0;
                        for k:=0 to a.m-1 do c.a[i]:=c.a[i]+a.a[i,k]*b.a[k] end end;
operator *(const a:Vector;const b:Matrix)c:Vector;
 var j,k:longint; begin if a.n<>b.n then halt(201); c.n:=b.m; setlength(c.a,c.n);
                        for j:=0 to c.n-1 do begin c.a[j]:=0;
                        for k:=0 to a.n-1 do c.a[j]:=c.a[j]+a.a[j]*b.a[k,j] end end;
procedure Scanf(var a:Vector;n:longint);
 var i:longint; begin a.n:=n; setlength(a.a,n); for i:=0 to n-1 do read(a.a[i]) end;
procedure Scanf(var a:Matrix;n,m:longint);
 var i,j:longint; begin a.n:=n; a.m:=m; setlength(a.a,n,m);
                        for i:=0 to n-1 do
                        for j:=0 to m-1 do read(a.a[i,j]) end;
procedure Printf(const a:Vector);
 var i:longint; begin if a.n<=0 then exit;
                      write('(',a.a[0]); for i:=1 to a.n-1 do write(',',a.a[i]); write(')') end;
procedure Printf(const a:Matrix);
 var i,j:longint; begin if (a.n<=0)or(a.m<=0) then exit;
                        for i:=0 to a.n-1 do begin
                        write('(',a.a[i,0]); for j:=1 to a.n-1 do write(',',a.a[i,j]); write(')') end end;

end.