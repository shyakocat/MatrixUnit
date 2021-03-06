unit MatrixUnit;

interface

uses math;
type
 psingle=^single;
 Vector2=array[1..2]of single;
 Matrix2=array[1..2,1..2]of single;
 Vector3=array[1..3]of single;
 Matrix3=array[1..3,1..3]of single;
 Vector4=array[1..4]of single;
 Matrix4=array[1..4,1..4]of single;
 Quaternion=record x,y,z,w:single end; //xi+yj+zk+w
 Vector=object n:longint; A:array of single;
 constructor Create(_n:Longint);
 function GetValue(i:Longint):single;
 procedure SetValue(i:Longint;const x:single);
 Function Copy:Vector;
 Procedure Free;
 property Items[i:Longint]:single read GetValue write SetValue;default; end;
 Matrix=object n,m:longint; A:array of array of single;
 constructor Create(_n,_m:Longint);
 function GetValue(i,j:Longint):single;
 procedure SetValue(i,j:Longint;const x:single);
 Function Copy:Matrix;
 Procedure Free;
 property Items[i,j:Longint]:single read GetValue write SetValue;default; end;
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
 Quat_I:Quaternion=(x:0;y:0;z:0;w:1);

procedure Swap(var a,b:single);

function Vec2(const a:single):Vector2;
function Vec2(const a1,a2:single):Vector2;
function Mat2(const a:single):Matrix2;
function Mat2(const a11,a12,a21,a22:single):Matrix2;
function Ptr(const a:Vector2):psingle;
function Ptr(const a:Matrix2):psingle;
operator =(const a,b:Vector2)c:boolean;
operator +(const a,b:Vector2)c:Vector2;
operator -(const a,b:Vector2)c:Vector2;
operator -(const a:Vector2)c:Vector2;
operator *(const a:Vector2;const t:single)c:Vector2;
operator /(const a:Vector2;const t:single)c:Vector2;
function dot_product(const a,b:Vector2):single;
function cross_product(const a,b:Vector2):single;
function mix(const a,b:Vector2;x:single):Vector2;
operator =(const a,b:Matrix2)c:boolean;
operator +(const a,b:Matrix2)c:Matrix2;
operator -(const a,b:Matrix2)c:Matrix2;
operator -(const a:Matrix2)c:Matrix2;
operator *(const b:Matrix2;const a:Vector2)c:Vector2;
operator *(const a,b:Matrix2)c:Matrix2;
operator *(const a:Matrix2;const t:single)c:Matrix2;
operator /(const a:Matrix2;const t:single)c:Matrix2;
function det(const a:Matrix2):single;
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
function Rotate2x2(t:single):Matrix2;

function Vec3(const a:single):Vector3;
function Vec3(const a1,a2,a3:single):Vector3;
function Vec3(const a:Vector4):Vector3;
function Vec3(const a:Quaternion):Vector3;
function Mat3(const a:single):Matrix3;
function Mat3(const a11,a12,a13,a21,a22,a23,a31,a32,a33:single):Matrix3;
function Mat3(const a:Matrix4):Matrix3;
function Ptr(const a:Vector3):psingle;
function Ptr(const a:Matrix3):psingle;
function mold(const a:Vector3):single;
function mold2(const a:Vector3):single;
function normalize(const a:Vector3):Vector3;
operator =(const a,b:Vector3)c:boolean;
operator +(const a,b:Vector3)c:Vector3;
operator -(const a,b:Vector3)c:Vector3;
operator -(const a:Vector3)c:Vector3;
operator *(const a:Vector3;const t:single)c:Vector3;
operator /(const a:Vector3;const t:single)c:Vector3;
function dot_product(const a,b:Vector3):single;
function cross_product(const a,b:Vector3):Vector3;
function mix(const a,b:Vector3;x:single):Vector3;
operator =(const a,b:Matrix3)c:boolean;
operator +(const a,b:Matrix3)c:Matrix3;
operator -(const a,b:Matrix3)c:Matrix3;
operator -(const a:Matrix3)c:Matrix3;
operator *(const b:Matrix3;const a:Vector3)c:Vector3;
operator *(const a,b:Matrix3)c:Matrix3;
operator *(const a:Matrix3;const t:single)c:Matrix3;
operator /(const a:Matrix3;const t:single)c:Matrix3;
function det(const a:Matrix3):single;
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
function RotateZ(a:single):Matrix3;
function RotateX(a:single):Matrix3;
function RotateY(a:single):Matrix3;
function RotateAxis(const s:Vector3;const a:single):Matrix3;
function RotateMMD(const R:Vector3):Matrix3;

function Vec4(const a:single):Vector4;
function Vec4(const a1,a2,a3,a4:single):Vector4;
function Mat4(const a:single):Matrix4;
function Mat4(const a11,a12,a13,a14,a21,a22,a23,a24,a31,a32,a33,a34,a41,a42,a43,a44:single):Matrix4;
function Ptr(const a:Vector4):psingle;
function Ptr(const a:Matrix4):psingle;
function mold(const a:Vector4):single;
function mold2(const a:Vector4):single;
function normalize(const a:Vector4):Vector4;
operator =(const a,b:Vector4)c:boolean;
operator +(const a,b:Vector4)c:Vector4;
operator -(const a,b:Vector4)c:Vector4;
operator -(const a:Vector4)c:Vector4;
operator *(const a:Vector4;const t:single)c:Vector4;
operator /(const a:Vector4;const t:single)c:Vector4;
function dot_product(const a,b:Vector4):single;
function mix(const a,b:Vector4;x:single):Vector4;
operator =(const a,b:Matrix4)c:boolean;
operator +(const a,b:Matrix4)c:Matrix4;
operator -(const a,b:Matrix4)c:Matrix4;
operator -(const a:Matrix4)c:Matrix4;
operator *(const b:Matrix4;const a:Vector4)c:Vector4;
operator *(const a,b:Matrix4)c:Matrix4;
operator *(const a:Matrix4;const t:single)c:Matrix4;
operator /(const a:Matrix4;const t:single)c:Matrix4;
function det(const a:Matrix4):single;
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

function Mat4pos(const a:Matrix4;x:Longint):single;
function Translate(const x,y,z:single):Matrix4;
function Translate(const a:Vector3):Matrix4;
function Rotate(a,x,y,z:single):Matrix4;
function Rotate(const ang:single;const a:Vector3):Matrix4;
function Scale(const x,y,z:single):Matrix4;
function Scale(const a:Vector3):Matrix4;


function Quat(const x,y,z,w:single):Quaternion;
function Quat(const a:Vector3;const w:single):Quaternion;
function Quat(const a:Vector4):Quaternion;
function Quat(const a:Matrix3):Quaternion;
function Quat(a,b:Vector3):Quaternion;
operator +(const a,b:Quaternion)c:Quaternion;
operator -(const a,b:Quaternion)c:Quaternion;
operator -(const a:Quaternion)c:Quaternion;
operator *(const a:Quaternion;const t:single)c:Quaternion;
operator /(const a:Quaternion;const t:single)c:Quaternion;
operator *(const a,b:Quaternion)c:Quaternion;
function Quaternion_Length(const a:Quaternion):single;
function Quaternion_Normalize(const a:Quaternion):Quaternion;
function conjugate(a:Quaternion):Quaternion;
function inverse(const a:Quaternion):Quaternion;
function Quaternion_Point(const a:Vector3):Quaternion;
function Quaternion_Euler(const a:Vector3):Quaternion;//Yaw,Picth,Roll
function Quaternion_Rotate(a:Vector3;t:single):Quaternion;
function EulerAngles(const a:Quaternion):Vector3;
function Rotate(const a,b:Vector3;const t:single):Vector3;
function Quaternion_Cast4(const a:Quaternion):Matrix4;
function Quaternion_Cast3(const a:Quaternion):Matrix3;
function Quaternion_Slerp(a,b:Quaternion;x:single):Quaternion;
function Mix(const a,b:Quaternion;x:single):Quaternion;
procedure Scanf(var a:Quaternion);
procedure Printf(const a:Quaternion);
procedure PrintfLn(const a:Quaternion);

function Vec(a:psingle;n:longint):Vector;
function Mat(a:psingle;n,m:longint):Matrix;
function Vec(n:Longint;const a:single):Vector;
function Mat(n,m:Longint;const a:single):Matrix;
operator =(const a,b:Vector)c:boolean;
operator =(const a,b:Matrix)c:boolean;
operator +(const a,b:Vector)c:Vector;
operator -(const a,b:Vector)c:Vector;
operator *(const a,b:Matrix)c:Matrix;
operator *(const a:Matrix;const b:Vector)c:Vector;
operator *(const a:Vector;const b:Matrix)c:Vector;
operator *(const a:Vector;const t:single)c:Vector;
operator *(const a:Matrix;const t:single)c:Matrix;
operator /(const a:Vector;const t:single)c:Vector;
operator /(const a:Matrix;const t:single)c:Matrix;
function det(const a:Matrix):single;
function cofactor(const a:Matrix;i,j:longint):Matrix;
function Transpose(const a:Matrix):Matrix;
function Adjugate(const a:Matrix):Matrix;
function Inverse(Const S:Matrix):Matrix;
procedure Swap(var a,b:Vector);
procedure Swap(var a,b:Matrix);
procedure Scanf(var a:Vector;n:longint);
procedure Scanf(var a:Matrix;n,m:longint);
procedure PrintfLn(const a:Vector);
procedure Printf(const a:Vector);
procedure Printf(const a:Matrix);


function qBound(a,b,c:Single):Single;


implementation

procedure Swap(var a,b:single);
 var c:single; begin c:=a; a:=b; b:=c end;

function Vec2(const a:single):Vector2;
 var c:Vector2; begin c[1]:=a; c[2]:=a; exit(c) end;
function Vec2(const a1,a2:single):Vector2;
 var c:Vector2; begin c[1]:=a1; c[2]:=a2; exit(c) end;
function Mat2(const a:single):Matrix2;
 var c:Matrix2; begin c[1,1]:=a; c[1,2]:=0; c[2,1]:=a; c[2,2]:=0; exit(c) end;
function Mat2(const a11,a12,a21,a22:single):Matrix2;
 var c:Matrix2; begin c[1,1]:=a11; c[1,2]:=a12; c[2,1]:=a21; c[2,2]:=a22; exit(c) end;
function Ptr(const a:Vector2):psingle;
 begin exit(@a) end;
function Ptr(const a:Matrix2):psingle;
 begin exit(@a) end;
operator =(const a,b:Vector2)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])) end;
operator +(const a,b:Vector2)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]+b[i] end;
operator -(const a,b:Vector2)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]-b[i] end;
operator -(const a:Vector2)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=-a[i] end;
operator *(const a:Vector2;const t:single)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]*t end;
operator /(const a:Vector2;const t:single)c:Vector2;
 var i:smallint; begin for i:=1 to 2 do c[i]:=a[i]/t end;
function dot_product(const a,b:Vector2):single;
 begin exit(a[1]*b[1]+a[2]*b[2]) end;
function cross_product(const a,b:Vector2):single;
 begin exit(a[1]*b[2]-a[2]*b[1]) end;
function mix(const a,b:Vector2;x:single):Vector2;
 begin exit(Vec2(a[1]*(1-x)+b[1]*x,a[2]*(1-x)+b[2]*x)) end;
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
operator *(const a:Matrix2;const t:single)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=a[i,j]*t end;
operator /(const a:Matrix2;const t:single)c:Matrix2;
 var i,j:smallint; begin for i:=1 to 2 do
                         for j:=1 to 2 do c[i,j]:=a[i,j]/t end;
function det(const a:Matrix2):single;
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
 var d:single; begin d:=det(a); if d=0 then exit(Mat2_0); exit(Adjugate(a)/d) end;
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
function Rotate2x2(t:single):Matrix2;
var _sin,_cos:single; begin t:=t*pi/180; _sin:=sin(t); _cos:=cos(t);
                            exit(Mat2(_cos,-_sin,_sin,_cos)) end;


function Vec3(const a:single):Vector3;
 var c:Vector3; begin c[1]:=a; c[2]:=a; c[3]:=a end;
function Vec3(const a1,a2,a3:single):Vector3;
 var c:Vector3; begin c[1]:=a1; c[2]:=a2; c[3]:=a3; exit(c) end;
function Vec3(const a:Vector4):Vector3;
 begin Vec3[1]:=a[1]; Vec3[2]:=a[2]; Vec3[3]:=a[3] end;
function Vec3(const a:Quaternion):Vector3;
 begin Vec3[1]:=a.x; Vec3[2]:=a.y; Vec3[3]:=a.z end;
function Mat3(const a:single):Matrix3;
 var c:Matrix3; begin fillchar(c,sizeof(c),0);
                      c[1,1]:=a; c[2,2]:=a; c[3,3]:=a; exit(c) end;
function Mat3(const a11,a12,a13,a21,a22,a23,a31,a32,a33:single):Matrix3;
 var c:Matrix3; begin c[1,1]:=a11; c[1,2]:=a12; c[1,3]:=a13;
                      c[2,1]:=a21; c[2,2]:=a22; c[2,3]:=a23;
                      c[3,1]:=a31; c[3,2]:=a32; c[3,3]:=a33; exit(c) end;
function Mat3(const a:Matrix4):Matrix3;
 var c:Matrix3; begin c[1,1]:=a[1,1]; c[1,2]:=a[1,2]; c[1,3]:=a[1,3];
                      c[2,1]:=a[2,1]; c[2,2]:=a[2,2]; c[2,3]:=a[2,3];
                      c[3,1]:=a[3,1]; c[3,2]:=a[3,2]; c[3,3]:=a[3,3]; exit(c) end;
function Ptr(const a:Vector3):psingle;
 begin exit(@a) end;
function Ptr(const a:Matrix3):psingle;
 begin exit(@a) end;
function mold(const a:Vector3):single;
 begin exit(sqrt(sqr(a[1])+sqr(a[2])+sqr(a[3]))) end;
function mold2(const a:Vector3):single;
 begin exit(sqr(a[1])+sqr(a[2])+sqr(a[3])) end;
function normalize(const a:Vector3):Vector3;
 var t:single; c:Vector3; begin t:=Mold(a); c[1]:=a[1]/t; c[2]:=a[2]/t; c[3]:=a[3]/t; exit(c) end;
operator =(const a,b:Vector3)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])and(a[3]=b[3])) end;
operator +(const a,b:Vector3)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]+b[i] end;
operator -(const a,b:Vector3)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]-b[i] end;
operator -(const a:Vector3)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=-a[i] end;
operator *(const a:Vector3;const t:single)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]*t end;
operator /(const a:Vector3;const t:single)c:Vector3;
 var i:smallint; begin for i:=1 to 3 do c[i]:=a[i]/t end;
function dot_product(const a,b:Vector3):single;
 begin exit(a[1]*b[1]+a[2]*b[2]+a[3]*b[3]) end;
//cross for vec3 = det for Mat3(i,j,k,a1,a2,a3,b1,b2,b3)
function cross_product(const a,b:Vector3):Vector3;
 begin exit(Vec3(a[2]*b[3]-b[2]*a[3],a[3]*b[1]-a[1]*b[3],a[1]*b[2]-a[2]*b[1])) end;
function mix(const a,b:Vector3;x:single):Vector3;
 begin exit(Vec3(a[1]*(1-x)+b[1]*x,a[2]*(1-x)+b[2]*x,a[3]*(1-x)+b[3]*x)) end;
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
operator *(const a:Matrix3;const t:single)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=a[i,j]*t end;
operator /(const a:Matrix3;const t:single)c:Matrix3;
 var i,j:smallint; begin for i:=1 to 3 do
                         for j:=1 to 3 do c[i,j]:=a[i,j]/t end;
function det(const a:Matrix3):single;
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
 var d:single; begin d:=det(a); if d=0 then exit(Mat3_0); exit(Adjugate(a)/d) end;
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


function RotateZ(a:single):Matrix3;
 var c:Matrix3; _sin,_cos:single; begin a:=a*pi/180; _sin:=sin(a); _cos:=cos(a);
                                      c[1,1]:= _cos; c[1,2]:=_sin; c[1,3]:=0;
                                      c[2,1]:=-_sin; c[2,2]:=_cos; c[2,3]:=0;
                                      c[3,1]:=0;     c[3,2]:=0;    c[3,3]:=1; exit(c) end;
function RotateX(a:single):Matrix3;
 var c:Matrix3; _sin,_cos:single; begin a:=a*pi/180; _sin:=sin(a); _cos:=cos(a);
                                      c[1,1]:=1; c[1,2]:=0;     c[1,3]:=0;
                                      c[2,1]:=0; c[2,2]:= _cos; c[2,3]:=_sin;
                                      c[3,1]:=0; c[3,2]:=-_sin; c[3,3]:=_cos; exit(c) end;
function RotateY(a:single):Matrix3;
 var c:Matrix3; _sin,_cos:single; begin a:=a*pi/180; _sin:=sin(a); _cos:=cos(a);
                                      c[1,1]:=_cos; c[1,2]:=0; c[1,3]:=-_sin;
                                      c[2,1]:=0;    c[2,2]:=1; c[2,3]:=0;
                                      c[3,1]:=_sin; c[3,2]:=0; c[3,3]:=_cos; exit(c) end;
function RotateAxis(const s:Vector3;const a:single):Matrix3;
 var u,v:single; begin if sqr(s[1])+sqr(s[3])<1e-7 then exit(RotateY(a));
                     u:=arccos(s[3]/sqrt(sqr(s[1])+sqr(s[3])))*180/pi;
                     v:=arcsin(s[2]/sqrt(sqr(s[1])+sqr(s[2])+sqr(s[3])))*180/pi;
                     exit(RotateY(-u)*RotateX(v)*RotateZ(a)*RotateX(-v)*RotateY(u)) end;
function RotateMMD(const R:Vector3):Matrix3;
 var a,b,c:Vector3; e,f:Matrix3; begin a:=Vec3(1,0,0); b:=Vec3(0,1,0); c:=Vec3(0,0,1); f:=Mat3_I;
                                       e:=RotateAxis(b, R[2]); a:=e*a; c:=e*c; f:=e*f;
                                       e:=RotateAxis(a,-R[1]); b:=e*b; c:=e*c; f:=e*f;
                                       e:=RotateAxis(c,-R[3]); a:=e*a; b:=e*b; f:=e*f; exit(f) end;


function Vec4(const a:single):Vector4;
 var c:Vector4; begin c[1]:=a; c[2]:=a; c[3]:=a; c[4]:=a end;
function Vec4(const a1,a2,a3,a4:single):Vector4;
 var c:Vector4; begin c[1]:=a1; c[2]:=a2; c[3]:=a3; c[4]:=a4; exit(c) end;
function Mat4(const a:single):Matrix4;
 var c:Matrix4; begin fillchar(c,sizeof(c),0);
                      c[1,1]:=a; c[2,2]:=a; c[3,3]:=a; c[4,4]:=a; exit(c) end;
function Mat4(const a11,a12,a13,a14,a21,a22,a23,a24,a31,a32,a33,a34,a41,a42,a43,a44:single):Matrix4;
 var c:Matrix4; begin c[1,1]:=a11; c[1,2]:=a12; c[1,3]:=a13; c[1,4]:=a14;
                      c[2,1]:=a21; c[2,2]:=a22; c[2,3]:=a23; c[2,4]:=a24;
                      c[3,1]:=a31; c[3,2]:=a32; c[3,3]:=a33; c[3,4]:=a34;
                      c[4,1]:=a41; c[4,2]:=a42; c[4,3]:=a43; c[4,4]:=a44; exit(c) end;
function Ptr(const a:Vector4):psingle;
 begin exit(@a) end;
function Ptr(const a:Matrix4):psingle;
 begin exit(@a) end;
function mold(const a:Vector4):single;
 begin exit(sqrt(sqr(a[1])+sqr(a[2])+sqr(a[3])+sqr(a[4]))) end;
function mold2(const a:Vector4):single;
 begin exit(sqr(a[1])+sqr(a[2])+sqr(a[3])+sqr(a[4])) end;
function normalize(const a:Vector4):Vector4;
 var t:single; begin t:=Mold(a); exit(a/t) end;
operator =(const a,b:Vector4)c:boolean;
 begin exit((a[1]=b[1])and(a[2]=b[2])and(a[3]=b[3])and(a[4]=b[4])) end;
operator +(const a,b:Vector4)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]+b[i] end;
operator -(const a,b:Vector4)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]-b[i] end;
operator -(const a:Vector4)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=-a[i] end;
operator *(const a:Vector4;const t:single)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]*t end;
operator /(const a:Vector4;const t:single)c:Vector4;
 var i:smallint; begin for i:=1 to 4 do c[i]:=a[i]/t end;
function dot_product(const a,b:Vector4):single;
 begin exit(a[1]*b[1]+a[2]*b[2]+a[3]*b[3]+a[4]*b[4]) end;
function mix(const a,b:Vector4;x:single):Vector4;
 begin exit(Vec4(a[1]*(1-x)+b[1]*x,a[2]*(1-x)+b[2]*x,a[3]*(1-x)+b[3]*x,a[4]*(1-x)+b[4]*x)) end;
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
operator *(const a:Matrix4;const t:single)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=a[i,j]*t end;
operator /(const a:Matrix4;const t:single)c:Matrix4;
 var i,j:smallint; begin for i:=1 to 4 do
                         for j:=1 to 4 do c[i,j]:=a[i,j]/t end;
function det(const a:Matrix4):single;
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
 var d:single; begin d:=det(a); if d=0 then exit(Mat4_0); exit(Adjugate(a)/d) end;
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


function Mat4pos(const a:Matrix4;x:Longint):single;
 begin exit(a[(x-1)div 4+1,(x-1)mod 4+1]) end;
function Translate(const x,y,z:single):Matrix4;
 begin exit(Mat4(1,0,0,x,0,1,0,y,0,0,1,z,0,0,0,1)) end;
function Rotate(a,x,y,z:single):Matrix4;
 var u,v:single; begin u:=1/sqrt(x*x+y*y+z*z); x:=x*u; y:=y*u; z:=z*u;
                     a:=a*pi/180; u:=cos(a); v:=sin(a);
                     exit(Mat4(x*x*(1-u)+u,x*y*(1-u)+z*v,x*z*(1-u)-y*v,0,
                               x*y*(1-u)-z*v,y*y*(1-u)+u,y*z*(1-u)+x*v,0,
                               x*z*(1-u)+y*v,y*z*(1-u)-x*v,z*z*(1-u)+u,0,
                               0,0,0,1)) end;
function Scale(const x,y,z:single):Matrix4;
 begin exit(Mat4(x,0,0,0,0,y,0,0,0,0,z,0,0,0,0,1)) end;
function Translate(const a:Vector3):Matrix4;
 begin exit(Translate(a[1],a[2],a[3])) end;
function Rotate(const ang:single;const a:Vector3):Matrix4;
 begin exit(Rotate(ang,a[1],a[2],a[3])) end;
function Scale(const a:Vector3):Matrix4;
 begin exit(Scale(a[1],a[2],a[3])) end;



function Quat(const x,y,z,w:single):Quaternion;
 begin Quat.x:=x; Quat.y:=y; Quat.z:=z; Quat.w:=w end;
function Quat(const a:Vector3;const w:single):Quaternion;
 begin exit(Quat(a[1],a[2],a[3],w)) end;
function Quat(const a:Vector4):Quaternion;
 begin exit(Quat(a[1],a[2],a[3],a[4])) end;
function Quat(const a:Matrix3):Quaternion;
 var s:single; begin s:=1+a[1,1]+a[2,2]+a[3,3];
                   if s>0 then with Quat do begin w:=sqrt(s)*0.5; s:=1/(4*w);
                                                  x:=(a[2,3]-a[3,2])*s;
                                                  y:=(a[3,1]-a[1,3])*s;
                                                  z:=(a[1,2]-a[2,1])*s; exit end;
                   s:=max(a[1,1],max(a[2,2],a[3,3]));
                   if s=a[1,1] then with Quat do begin s:=sqrt(1+a[1,1]-a[2,2]-a[3,3]);
                                                       x:=s*0.25;
                                                       s:=1/s;
                                                       w:=(a[2,3]-a[3,2])*s;
                                                       y:=(a[2,1]+a[1,2])*s;
                                                       z:=(a[3,1]+a[1,3])*s; exit end;
                   if s=a[2,2] then with Quat do begin s:=sqrt(1-a[1,1]+a[2,2]-a[3,3]);
                                                       y:=s*0.25;
                                                       s:=1/s;
                                                       w:=(a[3,1]-a[1,3])*s;
                                                       x:=(a[2,1]+a[1,2])*s;
                                                       z:=(a[3,2]+a[2,3])*s; exit end;
                 {if s=a[3,3] then} with Quat do begin s:=sqrt(1-a[1,1]-a[2,2]+a[3,3]);
                                                       z:=s*0.25;
                                                       s:=1/s;
                                                       w:=(a[1,2]-a[2,1])*s;
                                                       x:=(a[3,1]+a[1,3])*s;
                                                       y:=(a[3,2]+a[2,3])*s; exit end end;
function Quat(a,b:Vector3):Quaternion;
 var _cos,t,invt:single; r:Vector3; begin a:=normalize(a); b:=normalize(b);
                                       _cos:=dot_product(a,b);
                                       if _cos<-1+0.001 then begin
                                       r:=cross_product(Vec3_Z,a);
                                       if mold2(r)<0.01 then r:=cross_product(Vec3_X,a);
                                       r:=normalize(r); exit(Quaternion_Rotate(r,180)) end;
                                       r:=cross_product(a,b);
                                       t:=sqrt((1+_cos)*2); invt:=1/t;
                                       exit(Quat(r[1]*invt,r[2]*invt,r[3]*invt,t*0.5)) end;
operator +(const a,b:Quaternion)c:Quaternion;
 begin c.x:=a.x+b.x; c.y:=a.y+b.y; c.z:=a.z+b.z; c.w:=a.w+b.w end;
operator -(const a,b:Quaternion)c:Quaternion;
 begin c.x:=a.x-b.x; c.y:=a.y-b.y; c.z:=a.z-b.z; c.w:=a.w-b.w end;
operator -(const a:Quaternion)c:Quaternion;
 begin c.x:=-a.x; c.y:=-a.y; c.z:=-a.z; c.w:=-a.w end;
operator *(const a:Quaternion;const t:single)c:Quaternion;
 begin c.x:=a.x*t; c.y:=a.y*t; c.z:=a.z*t; c.w:=a.w*t end;
operator /(const a:Quaternion;const t:single)c:Quaternion;
 begin c.x:=a.x/t; c.y:=a.y/t; c.z:=a.z/t; c.w:=a.w/t end;
operator *(const a,b:Quaternion)c:Quaternion;
 begin c.x:=+a.x*b.w-a.y*b.z+a.z*b.y+a.w*b.x;
       c.y:=+a.x*b.z+a.y*b.w-a.z*b.x+a.w*b.y;
       c.z:=-a.x*b.y+a.y*b.x+a.z*b.w+a.w*b.z;
       c.w:=-a.x*b.x-a.y*b.y-a.z*b.z+a.w*b.w end;
function Quaternion_Length(const a:Quaternion):single;
 begin exit(sqrt(sqr(a.x)+sqr(a.y)+sqr(a.z)+sqr(a.w))) end;
function Quaternion_Normalize(const a:Quaternion):Quaternion;
 begin exit(a/Quaternion_Length(a)) end;
function conjugate(a:Quaternion):Quaternion;
 begin a.x:=-a.x; a.y:=-a.y; a.z:=-a.z; exit(a) end;
function inverse(const a:Quaternion):Quaternion;
 begin exit(conjugate(a)/(sqr(a.x)+sqr(a.y)+sqr(a.z)+sqr(a.w))) end;
function Quaternion_Point(const a:Vector3):Quaternion;
 begin with Quaternion_Point do begin x:=a[1]; y:=a[2]; z:=a[3]; w:=0 end end;
//if you Want Fast , take place /2 with *0.5
function Quaternion_Euler(const a:Vector3):Quaternion; //Z,Y,X -> pusi,theta,phi
 var sinu,sinv,sinw,cosu,cosv,cosw:single;
 begin sinu:=sin(a[1]/2); sinv:=sin(a[2]/2); sinw:=sin(a[3]/2);
       cosu:=cos(a[1]/2); cosv:=cos(a[2]/2); cosw:=cos(a[3]/2);
       exit(Quat(sinu*cosv*cosw-cosu*sinv*sinw,
                 cosu*sinv*cosw+sinu*cosv*sinw,
                 cosu*cosv*sinw-sinu*sinv*cosw,
                 cosu*cosv*cosw+sinu*sinv*sinw)) end;
function EulerAngles(const a:Quaternion):Vector3;      //arctan2(y,x)=arctan(y/x) arctan2->(-pi,pi] arctan->(-pi/2,pi/2]
 begin with a do Exit(Vec3(arctan2(2*(w*x+y*z),(1-2*(x*x+y*y))),
                           arcsin(2*(w*y-z*x)),
                           arctan2(2*(w*z+x*y),(1-2*(y*y+z*z))))) end;
function Quaternion_Rotate(a:Vector3;t:single):Quaternion;
 var _sin,_cos:single; c:Quaternion; begin t:=t*pi/360; _sin:=sin(t); _cos:=cos(t); a:=normalize(a);
 with c do begin w:=_cos; x:=a[1]*_sin; y:=a[2]*_sin; z:=a[3]*_sin end; exit(c) end;
function Rotate(const a,b:Vector3;const t:single):Vector3;
 var p,q:Quaternion; begin p:=Quaternion_Point(a); q:=Quaternion_Rotate(b,t);
                           with q*p*inverse(q) do begin Rotate[1]:=x; Rotate[2]:=y; Rotate[3]:=z end end;
function Quaternion_Cast4(const a:Quaternion):Matrix4;
 begin with a do exit(Mat4(2*(x*x+w*w)-1,2*(x*y+z*w),2*(x*z-y*w),0,
                           2*(x*y-z*w),2*(y*y+w*w)-1,2*(y*z+x*w),0,
                           2*(x*z+y*w),2*(y*z-x*w),2*(z*z+w*w)-1,0,
                           0,0,0,1)) end;
function Quaternion_Cast3(const a:Quaternion):Matrix3;
 begin with a do exit(Mat3(2*(x*x+w*w)-1,2*(x*y+z*w),2*(x*z-y*w),
                           2*(x*y-z*w),2*(y*y+w*w)-1,2*(y*z+x*w),
                           2*(x*z+y*w),2*(y*z-x*w),2*(z*z+w*w)-1)) end;
function Quaternion_Slerp(a,b:Quaternion;x:single):Quaternion;
 var _cos,_sin,_tan,_isin,u,v:single;
 begin if Quaternion_Length(a)*Quaternion_Length(b)<1e-7 then exit(a);
       a:=Quaternion_Normalize(a); b:=Quaternion_Normalize(b);
       _cos:=a.x*b.x+a.y*b.y+a.z*b.z+a.w*b.w;
       if _cos<0 then begin b:=-b; _cos:=-_cos end;
       if _cos>1-1e-5 then begin u:=1-x; v:=x end else
       begin _sin:=sqrt(1-sqr(_cos)); _isin:=1/_sin;
             _tan:=arctan2(_sin,_cos);
             u:=sin((1-x)*_tan)*_isin;
             v:=sin(x*_tan)*_isin end; exit(a*u+b*v) end;
function Mix(const a,b:Quaternion;x:single):Quaternion;
 begin Mix.x:=a.x*(1-x)+b.x*x;
       Mix.y:=a.y*(1-x)+b.y*x;
       Mix.z:=a.z*(1-x)+b.z*x;
       Mix.w:=a.w*(1-x)+b.w*x end;
procedure Scanf(var a:Quaternion);
 begin with a do read(x,y,z,w) end;
procedure Printf(const a:Quaternion);
 begin write('(x=',a.x+1e-7:10:6,',y=',a.y+1e-7:10:6,',z=',a.z+1e-7:10:6,',w=',a.w+1e-7:10:6,')') end;
procedure PrintfLn(const a:Quaternion);
 begin Printf(a); writeln end;


constructor Vector.Create(_n:Longint);
 begin n:=_n; SetLength(a,n) end;
function Vector.GetValue(i:Longint):single;
 begin exit(a[i-1]) end;
procedure Vector.SetValue(i:Longint;const x:single);
 begin a[i-1]:=x end;
Function Vector.Copy:Vector;
 Var Tmp:^Vector;
 Begin New(Tmp,Create(N)); Move(A[0],Tmp^.A[0],N*4); Exit(Tmp^) End;
Procedure Vector.Free;
 Begin SetLength(A,0) End;
constructor Matrix.Create(_n,_m:Longint);
 begin n:=_n; m:=_m; SetLength(a,n,m) end;
function Matrix.GetValue(i,j:Longint):single;
 begin exit(a[i-1,j-1]) end;
procedure Matrix.SetValue(i,j:Longint;const x:single);
 begin a[i-1,j-1]:=x end;
Function Matrix.Copy:Matrix;
 Var i:Longint; Tmp:^Matrix;
 Begin New(Tmp,Create(N,M)); For i:=0 to N-1 Do Move(A[i,0],Tmp^.A[i,0],M*4); Exit(Tmp^) End;
Procedure Matrix.Free;
 Begin SetLength(A,0,0) End;
function Vec(a:psingle;n:longint):Vector;
 var i:longint; c:Vector; begin c.n:=n; setlength(c.a,n);
                                for i:=0 to n-1 do c.a[i]:=a[i] end;
function Mat(a:psingle;n,m:longint):Matrix;
 var i,j:longint; c:Matrix; begin c.n:=n; c.m:=m; setlength(c.a,n,m);
                                  for i:=0 to n-1 do
                                  for j:=0 to m-1 do c.a[i,j]:=a[i*m+j] end;
function Vec(n:Longint;const a:single):Vector;
 var i:Longint; begin Vec.Create(n); for i:=0 to n-1 do Vec.a[i]:=a end;
function Mat(n,m:Longint;const a:single):Matrix;
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
                        for k:=0 to a.n-1 do c.a[j]:=c.a[j]+a.a[k]*b.a[k,j] end end;
operator *(const a:Vector;const t:single)c:Vector;
 var i:longint; begin c.n:=a.n; setlength(c.a,c.n); for i:=1 to c.n do c.a[i]:=a.a[i]*t end;
operator *(const a:Matrix;const t:single)c:Matrix;
 var i,j:Longint; begin c.n:=a.n; c.m:=a.m; setlength(c.a,c.n,c.m);
                        for i:=0 to c.n-1 do
                        for j:=0 to c.m-1 do c.a[i,j]:=a.a[i,j]*t end;
//Division is Slow?If want Fast.Try temp=1/t and a*=temp.
operator /(const a:Vector;const t:single)c:Vector;
 var i:longint; begin c.n:=a.n; setlength(c.a,c.n); for i:=0 to c.n-1 do c.a[i]:=a.a[i]/t end;
operator /(const a:Matrix;const t:single)c:Matrix;
 var i,j:Longint; begin c.n:=a.n; c.m:=a.m; setlength(c.a,c.n,c.m);
                        for i:=0 to c.n-1 do
                        for j:=0 to c.m-1 do c.a[i,j]:=a.a[i,j]/t end;
function det(const a:Matrix):single;
 var i,j,k:Longint; c:Matrix; t:single; begin if a.n<>a.m then halt(201201);
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
 var i,j:Longint; c:Matrix; begin c.n:=a.m; c.m:=a.n; SetLength(c.a,c.n,c.m);
                                  for i:=0 to c.n-1 do
                                  for j:=0 to c.m-1 do c.a[i,j]:=a.a[j,i]; exit(c) end;
function Adjugate(const a:Matrix):Matrix;
 var i,j:Longint; c:Matrix; begin if a.n<>a.m then halt(201201);
                                  c.n:=a.n; c.m:=c.n; SetLength(c.a,c.n,c.m);
                                  for i:=0 to c.n-1 do
                                  for j:=0 to c.n-1 do c.a[j,i]:=det(cofactor(a,i+1,j+1))*(1-(i+j)and 1<<1); exit(c) end;
{
2017/9/20
Method Change
From
        Algebraic cofactor
To
        Elementary transformation

function Inverse(const a:Matrix):Matrix;
 var d:single; begin if a.n<>a.m then halt(201201);
                   d:=det(a); if abs(d)<1e-7 then exit(Mat(a.n,a.m,0)); exit(Adjugate(a)/d) end;
}
Function Inverse(Const S:Matrix):Matrix;
//If The Matrix Is Big,It May Have A Problem Like Accuracy-Error
 var i,j,k:Longint; T:Single; A,B:Matrix;
 Begin if S.n<>S.m then halt(201201);
       A:=S.Copy;
       b:=mat(a.n,a.n,1);
       For i:=0 to a.n-1 Do Begin
       For j:=i to a.n-1 Do If Abs(A.a[j,i])>1e-7 then Break;
       If Abs(A.a[j,i])<1e-7 then Exit(mat(a.n,a.m,0));
       If J<>I then For k:=0 to a.n-1 do Begin Swap(A.a[i,k],A.a[j,k]); Swap(B.a[i,k],B.a[j,k]) End;
       T:=A.a[i,i]; //Not 1/A[i,i]
       For k:=0 to a.n-1 Do Begin A.a[i,k]:=A.a[i,k]/T; B.a[i,k]:=B.a[i,k]/T End;
       For j:=0 to a.n-1 Do If J<>I Then Begin T:=A.a[j,i];
       For k:=0 to a.n-1 Do Begin A.a[j,k]:=A.a[j,k]-A.a[i,k]*T; B.a[j,k]:=B.a[j,k]-B.a[i,k]*T End
       End End; A.Free;
       Exit(B) End;
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
                        write('(',a.a[i,0]:10:6); for j:=1 to a.m-1 do write(',',a.a[i,j]:10:6); writeln(')') end end;

function qBound(a,b,c:Single):Single;
begin if b<a then b:=a else
      if b>c then b:=c; exit(b) end;

end.
