unit MatrixUnit;

interface

uses math;
type
 preal=^real;
 Vector2=array[1..2]of real;
 Matrix2=array[1..2,1..2]of real;
 Vector3=array[1..3]of real;
 Matrix3=array[1..3,1..3]of real;
 Vector4=array[1..4]of real;
 Matrix4=array[1..4,1..4]of real;
 Quaternion=record x,y,z,w:real end; //xi+yj+zk+w
 Vector=object n:longint; A:array of real;
 constructor Create(_n:Longint);
 function GetValue(i:Longint):real;
 procedure SetValue(i:Longint;const x:real);
 property Items[i:Longint]:real read GetValue write SetValue;default; end;
 Matrix=object n,m:longint; A:array of array of real;
 constructor Create(_n,_m:Longint);
 function GetValue(i,j:Longint):real;
 procedure SetValue(i,j:Longint;const x:real);
 property Items[i,j:Longint]:real read GetValue write SetValue;default; end;
const
 Vec2_0:Vector2=(0,0);
 Vec3_0:Vector3=(0,0,0);
 Vec3_X:Vector3=(1,0,0);
 Vec3_Y:Vector3=(0,1,0);
 Vec3_Z:Vector3=(0,0,1);
 Vec4_0:Vector4=(0,0,0,0);
 Vec4_X:Vector4=(1,0,0,0);
 Vec4_Y:Vector4=(0,1,0,0);
 Vec4_Z:Vector4=(0,0,1,0);
 Vec4_W:Vector4=(0,0,0,1);
 Mat2_I:Matrix2=((1,0),(0,1));
 Mat2_0:Matrix2=((0,0),(0,0));
 Mat3_I:Matrix3=((1,0,0),(0,1,0),(0,0,1));
 Mat3_0:Matrix3=((0,0,0),(0,0,0),(0,0,0));
 Mat4_I:Matrix4=((1,0,0,0),(0,1,0,0),(0,0,1,0),(0,0,0,1));
 Mat4_0:Matrix4=((0,0,0,0),(0,0,0,0),(0,0,0,0),(0,0,0,0));
 Quaternion_0:Quaternion=(x:0;y:0;z:0;w:1);

procedure Swap(var a,b:real);

function Vec2(const a:real):Vector2;
function Vec2(const a1,a2:real):Vector2;
function Mat2(const a:real):Matrix2;
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
operator +(const a,b:Matrix2)c:Matrix2;
operator -(const a,b:Matrix2)c:Matrix2;
operator -(const a:Matrix2)c:Matrix2;
operator *(const b:Matrix2;const a:Vector2)c:Vector2;
operator *(const a,b:Matrix2)c:Matrix2;
operator *(const a:Matrix2;const t:real)c:Matrix2;
operator /(const a:Matrix2;const t:real)c:Matrix2;
function det(const a:Matrix2):real;
function Transpose(const a:Matrix2):Matrix2;
function Adjugate(const a:Matrix2):Matrix2;
function Inverse(const a:Matrix2):Matrix2;
procedure Swap(var a,b:Vector2);
procedure Swap(var a,b:Matrix2);
procedure Scanf(var a:Vector2);
procedure Scanf(var a:Matrix2);
procedure Printf(const a:Vector2);
procedure PrintfLn(const a:Vector2);
procedure Printf(const a:Matrix2);

function Vec3(const a:real):Vector3;
function Vec3(const a1,a2,a3:real):Vector3;
function Mat3(const a:real):Matrix3;
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
operator +(const a,b:Matrix3)c:Matrix3;
operator -(const a,b:Matrix3)c:Matrix3;
operator -(const a:Matrix3)c:Matrix3;
operator *(const b:Matrix3;const a:Vector3)c:Vector3;
operator *(const a,b:Matrix3)c:Matrix3;
operator *(const a:Matrix3;const t:real)c:Matrix3;
operator /(const a:Matrix3;const t:real)c:Matrix3;
function det(const a:Matrix3):real;
function cofactor(const a:Matrix3;i,j:longint):Matrix2;
function Transpose(const a:Matrix3):Matrix3;
function Adjugate(const a:Matrix3):Matrix3;
function Inverse(const a:Matrix3):Matrix3;
procedure Swap(var a,b:Vector3);
procedure Swap(var a,b:Matrix3);
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

function Vec4(const a:real):Vector4;
function Vec4(const a1,a2,a3,a4:real):Vector4;
function Mat4(const a:real):Matrix4;
function Mat4(const a11,a12,a13,a14,a21,a22,a23,a24,a31,a32,a33,a34,a41,a42,a43,a44:real):Matrix4;
function mold(const a:Vector4):real;
function mold2(const a:Vector4):real;
function normalize(const a:Vector4):Vector4;
operator =(const a,b:Vector4)c:boolean;
operator +(const a,b:Vector4)c:Vector4;
operator -(const a,b:Vector4)c:Vector4;
operator -(const a:Vector4)c:Vector4;
operator *(const a:Vector4;const t:real)c:Vector4;
operator /(const a:Vector4;const t:real)c:Vector4;
function dot_product(const a,b:Vector4):real;
operator =(const a,b:Matrix4)c:boolean;
operator +(const a,b:Matrix4)c:Matrix4;
operator -(const a,b:Matrix4)c:Matrix4;
operator -(const a:Matrix4)c:Matrix4;
operator *(const b:Matrix4;const a:Vector4)c:Vector4;
operator *(const a,b:Matrix4)c:Matrix4;
operator *(const a:Matrix4;const t:real)c:Matrix4;
operator /(const a:Matrix4;const t:real)c:Matrix4;
function det(const a:Matrix4):real;
function cofactor(const a:Matrix4;i,j:longint):Matrix3;
function Transpose(const a:Matrix4):Matrix4;
function Adjugate(const a:Matrix4):Matrix4;
function Inverse(const a:Matrix4):Matrix4;
procedure Swap(var a,b:Vector4);
procedure Swap(var a,b:Matrix4);
procedure Scanf(var a:Vector4);
procedure Scanf(var a:Matrix4);
procedure Printf(const a:Vector4);
procedure PrintfLn(const a:Vector4);
procedure Printf(const a:Matrix4);

function Mat4pos(const a:Matrix4;x:Longint):real;
function Translate(const x,y,z:real):Matrix4;
function Rotate(a,x,y,z:real):Matrix4;
function Scale(const x,y,z:real):Matrix4;


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
function Quaternion_Cast(const a:Quaternion):Matrix4;
procedure Scanf(var a:Quaternion);
procedure Printf(const a:Quaternion);
procedure PrintfLn(const a:Quaternion);

function Vec(a:preal;n:longint):Vector;
function Mat(a:preal;n,m:longint):Matrix;
function Vec(n:Longint;const a:real):Vector;
function Mat(n,m:Longint;const a:real):Matrix;
operator =(const a,b:Vector)c:boolean;
operator =(const a,b:Matrix)c:boolean;
operator +(const a,b:Vector)c:Vector;
operator -(const a,b:Vector)c:Vector;
operator *(const a,b:Matrix)c:Matrix;
operator *(const a:Matrix;const b:Vector)c:Vector;
operator *(const a:Vector;const b:Matrix)c:Vector;
operator *(const a:Vector;const t:real)c:Vector;
operator *(const a:Matrix;const t:real)c:Matrix;
operator /(const a:Vector;const t:real)c:Vector;
operator /(const a:Matrix;const t:real)c:Matrix;
function det(const a:Matrix):real;
function cofactor(const a:Matrix;i,j:longint):Matrix;
function Transpose(const a:Matrix):Matrix;
function Adjugate(const a:Matrix):Matrix;
function Inverse(const a:Matrix):Matrix;
procedure Swap(var a,b:Vector);
procedure Swap(var a,b:Matrix);
procedure Scanf(var a:Vector;n:longint);
procedure Scanf(var a:Matrix;n,m:longint);
procedure PrintfLn(const a:Vector);
procedure Printf(const a:Vector);
procedure Printf(const a:Matrix);



implementation

procedure Swap(var a,b:real);
 var c:real; begin c:=a; a:=b; b:=c end;

function Vec2(const a:real):Vector2;
 var c:Vector2; begin c[1]:=a; c[2]:=a; exit(c) end;
function Vec2(const a1,a2:real):Vector2;
 var c:Vector2; begin c[1]:=a1; c[2]:=a2; exit(c) end;
function Mat2(const a:real):Matrix2;
 var c:Matrix2; begin c[1,1]:=a; c[1,2]:=0; c[2,1]:=a; c[2,2]:=0; exit(c) end;
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
operator +(const a,b:Matrix2)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=a[i,j]+b[i,j] end;
operator -(const a,b:Matrix2)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=a[i,j]-b[i,j] end;
operator -(const a:Matrix2)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=-a[i,j] end;
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
procedure Swap(var a,b:Vector2);
 var c:Vector2; begin c:=a; a:=b; b:=c end;
procedure Swap(var a,b:Matrix2);
 var c:Matrix2; begin c:=a; a:=b; b:=c end;
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


function Vec3(const a:real):Vector3;
 var c:Vector3; begin c[1]:=a; c[2]:=a; c[3]:=a end;
function Vec3(const a1,a2,a3:real):Vector3;
 var c:Vector3; begin c[1]:=a1; c[2]:=a2; c[3]:=a3; exit(c) end;
function Mat3(const a:real):Matrix3;
 var c:Matrix3; begin fillchar(c,sizeof(c),0);
                      c[1,1]:=a; c[2,2]:=a; c[3,3]:=a; exit(c) end;
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
operator +(const a,b:Matrix3)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=a[i,j]+b[i,j] end;
operator -(const a,b:Matrix3)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=a[i,j]-b[i,j] end;
operator -(const a:Matrix3)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=-a[i,j] end;
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
procedure Swap(var a,b:Vector3);
 var c:Vector3; begin c:=a; a:=b; b:=c end;
procedure Swap(var a,b:Matrix3);
 var c:Matrix3; begin c:=a; a:=b; b:=c end;
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



function Vec4(const a:real):Vector4;
 var c:Vector4; begin c[1]:=a; c[2]:=a; c[3]:=a; c[4]:=a end;
function Vec4(const a1,a2,a3,a4:real):Vector4;
 var c:Vector4; begin c[1]:=a1; c[2]:=a2; c[3]:=a3; c[4]:=a4; exit(c) end;
function Mat4(const a:real):Matrix4;
 var c:Matrix4; begin fillchar(c,sizeof(c),0);
                      c[1,1]:=a; c[2,2]:=a; c[3,3]:=a; c[4,4]:=a; exit(c) end;
function Mat4(const a11,a12,a13,a14,a21,a22,a23,a24,a31,a32,a33,a34,a41,a42,a43,a44:real):Matrix4;
 var c:Matrix4; begin c[1,1]:=a11; c[1,2]:=a12; c[1,3]:=a13; c[1,4]:=a14;
                      c[2,1]:=a21; c[2,2]:=a22; c[2,3]:=a23; c[2,4]:=a24;
                      c[3,1]:=a31; c[3,2]:=a32; c[3,3]:=a33; c[3,4]:=a34;
                      c[4,1]:=a41; c[4,2]:=a42; c[4,3]:=a43; c[4,4]:=a44; exit(c) end;
function mold(const a:Vector4):real;
 begin exit(sqrt(sqr(a[1])+sqr(a[2])+sqr(a[3])+sqr(a[4]))) end;
function mold2(const a:Vector4):real;
 begin exit(sqr(a[1])+sqr(a[2])+sqr(a[3])+sqr(a[4])) end;
function normalize(const a:Vector4):Vector4;
 var t:real; begin t:=Mold(a); exit(a/t) end;
operator =(const a,b:Vector4)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])and(a[3]=b[3])and(a[4]=b[4])) end;
operator +(const a,b:Vector4)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]+b[i] end;
operator -(const a,b:Vector4)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]-b[i] end;
operator -(const a:Vector4)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=-a[i] end;
operator *(const a:Vector4;const t:real)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]*t end;
operator /(const a:Vector4;const t:real)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]/t end;
function dot_product(const a,b:Vector4):real;
 begin exit(a[1]*b[1]+a[2]*b[2]+a[3]*b[3]+a[4]*b[4]) end;
operator =(const a,b:Matrix4)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])and(a[3]=b[3])and(a[4]=b[4])) end;
operator +(const a,b:Matrix4)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=a[i,j]+b[i,j] end;
operator -(const a,b:Matrix4)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=a[i,j]-b[i,j] end;
operator -(const a:Matrix4)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=-a[i,j] end;
operator *(const b:Matrix4;const a:Vector4)c:Vector4;
 var i,k:smallint; begin fillchar(c,sizeof(c),0);
                         for i:=1 to 4 do
                         for k:=1 to 4 do c[i]:=c[i]+b[i,k]*a[k] end;
operator *(const a,b:Matrix4)c:Matrix4;
 var i,j,k:smallint; begin fillchar(c,sizeof(c),0);
                           for i:=1 to 4 do
                           for j:=1 to 4 do
                           for k:=1 to 4 do c[i,j]:=c[i,j]+a[i,k]*b[k,j] end;
operator *(const a:Matrix4;const t:real)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=a[i,j]*t end;
operator /(const a:Matrix4;const t:real)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=a[i,j]/t end;
function det(const a:Matrix4):real;
 begin exit(a[1,1]*det(Mat3(a[2,2],a[2,3],a[2,4],a[3,2],a[3,3],a[3,4],a[4,2],a[4,3],a[4,4]))
           -a[1,2]*det(Mat3(a[2,1],a[2,3],a[2,4],a[3,1],a[3,3],a[3,4],a[4,1],a[4,3],a[4,4]))
           +a[1,3]*det(Mat3(a[2,1],a[2,2],a[2,4],a[3,1],a[3,2],a[3,4],a[4,1],a[4,2],a[4,4]))
           -a[1,4]*det(Mat3(a[2,1],a[2,2],a[2,3],a[3,1],a[3,2],a[3,3],a[4,1],a[4,2],a[4,3]))) end;
function cofactor(const a:Matrix4;i,j:longint):Matrix3;
 var x,y:smallint; z:Matrix3; begin for x:=1 to i-1 do
                                    for y:=1 to j-1 do z[x,y]:=a[x,y];
                                    for x:=i to   3 do
                                    for y:=1 to j-1 do z[x,y]:=a[x+1,y];
                                    for x:=1 to i-1 do
                                    for y:=j to   3 do z[x,y]:=a[x,y+1];
                                    for x:=i to   3 do
                                    for y:=j to   3 do z[x,y]:=a[x+1,y+1]; exit(z) end;
function Transpose(const a:Matrix4):Matrix4;
 var i,j:smallint; z:Matrix4; begin for i:=1 to 4 do
                                    for j:=1 to 4 do z[i,j]:=a[j,i]; exit(z) end;
function Adjugate(const a:Matrix4):Matrix4;
 var i,j:smallint; z,y:Matrix4;
 begin y:=Transpose(a); for i:=1 to 4 do
                        for j:=1 to 4 do z[i,j]:=det(cofactor(y,i,j))*(1-(i+j)and 1<<1);
       exit(z) end;
function Inverse(const a:Matrix4):Matrix4;
 var d:real; begin d:=det(a); if d=0 then exit(Mat4_0); exit(Adjugate(a)/d) end;
procedure Swap(var a,b:Vector4);
 var c:Vector4; begin c:=a; a:=b; b:=c end;
procedure Swap(var a,b:Matrix4);
 var c:Matrix4; begin c:=a; a:=b; b:=c end;
procedure Scanf(var a:Vector4);
 begin read(a[1],a[2],a[3],a[4]) end;
procedure Scanf(var a:Matrix4);
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do read(a[i,j]) end;
procedure Printf(const a:Vector4);
 begin write('(',a[1]+1e-7:10:6,',',a[2]+1e-7:10:6,',',a[3]+1e-7:10:6,',',a[4]+1e-7:10:6,')') end;
procedure PrintfLn(const a:Vector4);
 begin Printf(a); writeln end;
procedure Printf(const a:Matrix4);
 var i:smallint; begin for i:=1 to 4 do PrintfLn(a[i]) end;


function Mat4pos(const a:Matrix4;x:Longint):real;
 begin exit(a[(x-1)div 4+1,(x-1)mod 4+1]) end;
function Translate(const x,y,z:real):Matrix4;
 begin exit(Mat4(1,0,0,x,0,1,0,y,0,0,1,z,0,0,0,1)) end;
function Rotate(a,x,y,z:real):Matrix4;
 var u,v:real; begin u:=1/sqrt(x*x+y*y+z*z); x:=x*u; y:=y*u; z:=z*u;
                     a:=a*pi/180; u:=cos(a); v:=sin(a);
                     exit(Mat4(x*x*(1-u)+u,x*y*(1-u)+z*v,x*z*(1-u)-y*v,0,
                               x*y*(1-u)-z*v,y*y*(1-u)+u,y*z*(1-u)+x*v,0,
                               x*z*(1-u)+y*v,y*z*(1-u)-x*v,z*z*(1-u)+u,0,
                               0,0,0,1)) end;
function Scale(const x,y,z:real):Matrix4;
 begin exit(Mat4(x,0,0,0,0,y,0,0,0,0,z,0,0,0,0,1)) end;



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
function Quaternion_Cast(const a:Quaternion):Matrix4;
 begin with a do exit(Mat4(2*(x*x+w*w)-1,2*(x*y+z*w),2*(x*z-y*w),0,
                           2*(x*y-z*w),2*(y*y+w*w)-1,2*(y*z+x*w),0,
                           2*(x*z+y*w),2*(y*z-x*w),2*(z*z+w*w)-1,0,
                           0,0,0,1)) end;
procedure Scanf(var a:Quaternion);
 begin with a do read(x,y,z,w) end;
procedure Printf(const a:Quaternion);
 begin write('(x=',a.x+1e-7:10:6,',y=',a.y+1e-7:10:6,',z=',a.z+1e-7:10:6,',w=',a.w+1e-7:10:6,')') end;
procedure PrintfLn(const a:Quaternion);
 begin Printf(a); writeln end;


constructor Vector.Create(_n:Longint);
 begin n:=_n; SetLength(a,n) end;
function Vector.GetValue(i:Longint):real;
 begin exit(a[i-1]) end;
procedure Vector.SetValue(i:Longint;const x:real);
 begin a[i-1]:=x end;
constructor Matrix.Create(_n,_m:Longint);
 begin n:=_n; m:=_m; SetLength(a,n,m) end;
function Matrix.GetValue(i,j:Longint):real;
 begin exit(a[i-1,j-1]) end;
procedure Matrix.SetValue(i,j:Longint;const x:real);
 begin a[i-1,j-1]:=x end;
function Vec(a:preal;n:longint):Vector;
 var i:longint; c:Vector; begin c.n:=n; setlength(c.a,n);
                                for i:=0 to n-1 do c.a[i]:=a[i] end;
function Mat(a:preal;n,m:longint):Matrix;
 var i,j:longint; c:Matrix; begin c.n:=n; c.m:=m; setlength(c.a,n,m);
                                  for i:=0 to n-1 do
                                  for j:=0 to m-1 do c.a[i,j]:=a[i*m+j] end;
function Vec(n:Longint;const a:real):Vector;
 var i:Longint; begin Vec.Create(n); for i:=0 to n-1 do Vec.a[i]:=a end;
function Mat(n,m:Longint;const a:real):Matrix;
 var i,j:Longint; begin Mat.Create(n,m); for i:=0 to n-1 do
                                         for j:=0 to m-1 do Mat.a[i,j]:=0;
                        for i:=0 to min(n,m)-1 do Mat.a[i,i]:=a end;
operator =(const a,b:Vector)c:boolean;
 var i:longint; begin if a.n<>b.n then exit(false);
                      for i:=0 to a.n-1 do if a.a[i]<>b.a[i] then exit(false); exit(true) end;
operator =(const a,b:Matrix)c:boolean;
 var i,j:longint; begin if (a.n<>b.n)or(a.m<>b.m) then exit(false);
                        for i:=0 to a.n-1 do
                        for j:=0 to a.m-1 do if a.a[i,j]<>b.a[i,j] then exit(false); exit(true) end;
operator +(const a,b:Vector)c:Vector;
 var i:longint; begin if a.n<>b.n then halt(201201); c.n:=a.n; setlength(c.a,c.n);
                      for i:=0 to c.n-1 do c.a[i]:=a.a[i]+b.a[i] end;
operator -(const a,b:Vector)c:Vector;
 var i:longint; begin if a.n<>b.n then halt(201201); c.n:=a.n; setlength(c.a,c.n);
                      for i:=0 to c.n-1 do c.a[i]:=a.a[i]-b.a[i] end;
operator *(const a,b:Matrix)c:Matrix;
 var i,j,k:longint; begin if a.m<>b.n then halt(201201); c.n:=a.n; c.m:=b.m; setlength(c.a,c.n,c.m);
                          for i:=0 to c.n-1 do
                          for j:=0 to c.m-1 do begin c.a[i,j]:=0;
                          for k:=0 to a.m-1 do c.a[i,j]:=c.a[i,j]+a.a[i,k]*b.a[k,j] end end;
operator *(const a:Matrix;const b:Vector)c:Vector;
 var i,k:longint; begin if a.m<>b.n then halt(201201); c.n:=a.n; setlength(c.a,c.n);
                        for i:=0 to c.n-1 do begin c.a[i]:=0;
                        for k:=0 to a.m-1 do c.a[i]:=c.a[i]+a.a[i,k]*b.a[k] end end;
operator *(const a:Vector;const b:Matrix)c:Vector;
 var j,k:longint; begin if a.n<>b.n then halt(201201); c.n:=b.m; setlength(c.a,c.n);
                        for j:=0 to c.n-1 do begin c.a[j]:=0;
                        for k:=0 to a.n-1 do c.a[j]:=c.a[j]+a.a[j]*b.a[k,j] end end;
operator *(const a:Vector;const t:real)c:Vector;
 var i:longint; begin c.n:=a.n; setlength(c.a,c.n); for i:=1 to c.n do c.a[i]:=a.a[i]*t end;
operator *(const a:Matrix;const t:real)c:Matrix;
 var i,j:Longint; begin c.n:=a.n; c.m:=a.m; setlength(c.a,c.n,c.m);
                        for i:=0 to c.n-1 do
                        for j:=0 to c.m-1 do c.a[i,j]:=a.a[i,j]*t end;
//Division is Slow?If want Fast.Try temp=1/t and a*=temp.
operator /(const a:Vector;const t:real)c:Vector;
 var i:longint; begin c.n:=a.n; setlength(c.a,c.n); for i:=0 to c.n-1 do c.a[i]:=a.a[i]/t end;
operator /(const a:Matrix;const t:real)c:Matrix;
 var i,j:Longint; begin c.n:=a.n; c.m:=a.m; setlength(c.a,c.n,c.m);
                        for i:=0 to c.n-1 do
                        for j:=0 to c.m-1 do c.a[i,j]:=a.a[i,j]/t end;
function det(const a:Matrix):real;
 var i,j,k:Longint; c:Matrix; t:real; begin if a.n<>a.m then halt(201201);
                                            det:=1; SetLength(c.a,a.n,a.n);
                                            for i:=0 to a.n-1 do
                                            for j:=0 to a.n-1 do c.a[i,j]:=a.a[i,j];
                                            for i:=0 to a.n-1 do begin
                                            if abs(c.a[i,i])<1e-7 then begin k:=0;
                                             for j:=i+1 to a.n-1 do if abs(c.a[j,i])>1e-7 then begin k:=1; break end;
                                             if k=0 then exit(0); det:=-det;
                                             for k:=i to a.n-1 do Swap(c.a[i,k],c.a[j,k]) end;
                                             for j:=i+1 to a.n-1 do begin t:=c.a[j,i]/c.a[i,i];
                                             for k:=i to a.n-1 do c.a[j,k]:=c.a[j,k]-c.a[i,k]*t end;
                                             det:=det*c.a[i,i]
                                            end end;
function cofactor(const a:Matrix;i,j:longint):Matrix;
 var x,y:Longint; c:Matrix; begin if a.n<>a.m then halt(201201);
                                  dec(i); dec(j);
                                  c.n:=a.n-1; c.m:=a.m-1; SetLength(c.a,c.n,c.m);
                                  for x:=0 to a.n-1 do
                                  for y:=0 to a.m-1 do
                                  if (x<>i)and(y<>j) then c.a[x-ord(x>i),y-ord(y>j)]:=a.a[x,y]; exit(c) end;
function Transpose(const a:Matrix):Matrix;
 var i,j:Longint; c:Matrix; begin if a.n<>a.m then halt(201201);
                                  c.n:=a.n; c.m:=c.n;
                                  for i:=0 to c.n-1 do
                                  for j:=0 to c.n-1 do c.a[i,j]:=a.a[j,i]; exit(c) end;
function Adjugate(const a:Matrix):Matrix;
 var i,j:Longint; c:Matrix; begin if a.n<>a.m then halt(201201);
                                  c.n:=a.n; c.m:=c.n; SetLength(c.a,c.n,c.m);
                                  for i:=0 to c.n-1 do
                                  for j:=0 to c.n-1 do c.a[j,i]:=det(cofactor(a,i+1,j+1))*(1-(i+j)and 1<<1); exit(c) end;
function Inverse(const a:Matrix):Matrix;
 var d:real; begin if a.n<>a.m then halt(201201);
                   d:=det(a); if abs(d)<1e-7 then exit(Mat(a.n,a.m,0)); exit(Adjugate(a)/d) end;
procedure Swap(var a,b:Vector);
 var c:Vector; begin c:=a; a:=b; b:=c end;
procedure Swap(var a,b:Matrix);
 var c:Matrix; begin c:=a; a:=b; b:=c end;
procedure Scanf(var a:Vector;n:longint);
 var i:longint; begin a.n:=n; setlength(a.a,n); for i:=0 to n-1 do read(a.a[i]) end;
procedure Scanf(var a:Matrix;n,m:longint);
 var i,j:longint; begin a.n:=n; a.m:=m; setlength(a.a,n,m);
                        for i:=0 to n-1 do
                        for j:=0 to m-1 do read(a.a[i,j]) end;
procedure Printf(const a:Vector);
 var i:longint; begin if a.n<=0 then exit;
                      write('(',a.a[0]:10:6); for i:=1 to a.n-1 do write(',',a.a[i]:10:6); write(')') end;
procedure PrintfLn(const a:Vector);
 begin Printf(a); writeln end;
procedure Printf(const a:Matrix);
 var i,j:longint; begin if (a.n<=0)or(a.m<=0) then exit;
                        for i:=0 to a.n-1 do begin
                        write('(',a.a[i,0]:10:6); for j:=1 to a.n-1 do write(',',a.a[i,j]:10:6); writeln(')') end end;

end.
