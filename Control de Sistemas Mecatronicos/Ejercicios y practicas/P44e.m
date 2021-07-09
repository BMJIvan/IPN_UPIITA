% clc
% close all

syms s u t tao
I=eye(2);
A=[0,1;-550/1300,-4000/1300];
B=[0;10/1300];
C=[1,0];

MatExp=ilaplace(inv(s*I-A));
MEt=vpa(MatExp);

MEtao=subs(MEt,t,-tao);
% MEtao=subs(MEtao,tao,tao+1);
fun=MEt*MEtao*B*u;
Xsc=int(fun,tao,0,t);
% Xsc=simplify(Xsc);
Ct=subs(Xsc,t,0.01);
Cc=subs(Ct,u,1);
Xcc=Xsc-Cc;

y=C*Xcc;
% y=X;
% y=simplify(y);