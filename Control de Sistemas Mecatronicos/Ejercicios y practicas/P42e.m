clc
close all

syms s u t tao
I=eye(4);

A=[0,1,0,0
   -9/50,0,9/50,0
   0,0,0,1
   1,0,-1,-1];
B=[0;1/50;0;0];
C=[1,0,0,0];

MatExp=ilaplace(inv(s*I-A));
MEt=vpa(MatExp);

MEtao=subs(MEt,t,-tao);
MEtao=subs(MEtao,tao,tao+1);
fun=MEt*MEtao*B*u;
Xsc=int(fun,tao,0,t);

Ct=subs(Xsc,t,1);
Cc=subs(Ct,u,1);
Xcc=Xsc-(Cc);

y=C*Xcc;
% y=X;
% y=simplify(y);
