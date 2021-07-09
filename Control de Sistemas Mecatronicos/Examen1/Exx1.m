clc
close all
clear all

syms s t u tao
c1=1;
c2=2;
r1=1;
r2=2;
u=10*sin(t);
A=[(-1/c1)*((r1+r2)/(r1*r2)),-1/(c1*r2)
    0,(1/c2)*(1/(r1-r2))];
B=[(1/c1)*((r2+r1)/(r1*r2));0];
C=[0 -1];
D=1;
x0=[1;1];
ME=ilaplace(inv(s*I-A))

cr2=size(B,1);
Ck=[B A*B A^2*B A^3*B A^4*B A^5*B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A;C*A^2;C*A^3;C*A^4;C*A^5];
co0=rank(Ok);
co=obsv(A,C);
co1=rank(co);
if(cr2==cr1&&cr1==cr2)
    disp('controlable')
else
    disp('no controlable')
end
if(cr0==co0&&cr0==co1)
    disp('observable')
else
    disp('no observable')
end