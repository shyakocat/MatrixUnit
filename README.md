# MatrixUnit     
    
◆Pascal的简易矩阵库                 
                 
*2017/5/4  建立*                
>基本类型                  
>>◀Vector2/Vector3       二维向量/三维向量▶                  
>>◀Matrix2/Matrix3       二维矩阵/三维矩阵▶                   
>>◀Quaternion      四元数▶                   
                           
>基本方法                   
>>◀Vec2/Vec3/Mat2/Mat3     构造向量/矩阵▶                    
>>◀=/+/-/*     基本运算▶                      
>>◀Scanf/Printf/PrintfLn     输入输出▶                    
>>◀dot_product/cross_product     点积/叉积▶                       
>>◀det/cofactor/Transpose/Adjugate/Inverse     行列式/余子式/转置矩阵/伴随矩阵/逆矩阵▶                      
>>◀mold/mold2/normalize     模长/模长平方/向量标准化▶                      
>>◀RotateX/RotateY/RotateZ/RotateAxis     绕x轴旋转/绕y轴旋转/绕z轴旋转/绕任意轴旋转（结果是矩阵）▶                    
>>◀Quaternion_N/Quaternion_Normalize     四元数模/四元数标准化▶                       
>>◀Rotate     四元数计算绕任意轴旋转▶                        
                                 
>用途                          
>>◀3d碰撞检测▶                                
              
              
              
*2017/7/29  补充*             
>介于重构PmdDeal.pas时骨骼蒙皮需要近似OpenGL矩阵运算的各种功能（有向GLM靠拢的趋势，但不计效率）。              
>此次重构旨在支持简单的mmd动画，并且重构后的代码会支持在shyakocat的SimpleAnimeUnit中绘制！                
>>◁新增了Matrix4▷             
>>◁补充了泛用Vector,Matrix的操作（如求逆矩阵等）▷              
>>◁新增了针对Matrix4的三个操作：Translate,Rotate,Scale（其中Rotate不支持逆向变换？正在研究原因中）▷              
