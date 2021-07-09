clc
close all

syms s u t tao
I=eye(1);
A=[-25/18];
B=[5/6];
C=[1/10];

MatExp=ilaplace(inv(s*I-A));
MEt=vpa(MatExp);

MEtao=subs(MEt,t,-tao);
% MEtao=subs(MEtao,tao,tao+1);
fun=MEt*MEtao*B*u;
Xsc=int(fun,tao,0,t);

Ct=subs(Xsc,t,0);
Cc=subs(Ct,u,0);
Xcc=Xsc-Cc;

y=C*Xcc;
% y=X;
% y=simplify(y);
