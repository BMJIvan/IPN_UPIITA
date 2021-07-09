clc
close all
% syms c1 c2 r1 r2 r3 u j1 j2 j3 s vcp1 vcp2
% 
% a=r2+(1/c2*s);
% b=r2;
% c=1/c2*s;
% d=r2;
% e=r1+r2+r3;
% f=-r3;
% g=1/c2*s;
% h=-r3;
% j=r3+(1/c1*s)+(1/c2*s);
% se=[a,b,c;d,e,f;g,h,j];
% seb=det(se);
% 
% j1b=se;
% j1b(:,1)=[u,0,0];
% j3b=se;
% j3b(:,3)=[u,0,0];
% 
% vcp1=det(j1b)/seb;
% vcp2=det(j3b)/seb;

r1=5;
r2=10;
r3=1;
c1=1;
c2=2;

A=[(-1/c1)*((r1+r3)/(r1*r3)),1/(r3*c1);1/(c2*r3),(-1/c2)*((r2+r3)/(r2*r3))];
B=[1/(r1*c1);1/(r2*c2)];
C=[1,-1];
% U=sin(t);
vp=eig(A);
fil=size(A,2);

x0=[10;5];
syms s t
Us=10/((s*s)+1);
det=inv(s*eye(fil)-A);
Pa=ilaplace(det)*x0;
% Pb=ilaplace(det*B*(u/s));
Pb=ilaplace(det*B*(Us));
xt=Pa+Pb;
yt=C*xt;