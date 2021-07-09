clc
close all

syms s u t tao

m1=2;
m2=1;
m3=1;
v1=1;
v2=1;
v3=1;
v4=1;
v5=1;
k=2;

I=eye(6);

A=[0,1,0,0,0,0;
  -k/m1,(-v2-v4-v1)/m1,k/m1,v2/m1,0,v4/m1
  0,0,0,1,0,0 
  k/m2,v2/m2,-k/m2,(-v2-v5)/m2,0,v5/m2
  0,0,0,0,0,1
  0,v4/m3,0,v5/m3,0,(-v4-v3-v5)/m3
    ];
B=[0;0;0;1/m2;0;0];
C=[0,0,0,1,0,0];

MatExp=ilaplace(inv(s*I-A));
MEt=vpa(MatExp);

MEtao=subs(MEt,t,-tao);
fun=MEt*MEtao*B*u;
Xsc=int(fun,tao,0,t);

Ct=subs(Xsc,t,1);
Cc=subs(Ct,u,1);
Xcc=Xsc-(Cc);

y=C*Xcc;
% y=X;
% y=simplify(y);
