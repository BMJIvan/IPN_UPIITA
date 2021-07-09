clc
% clear all
close all

syms s r t
a1=230*s;
a2=-30*s;
a3=0;
a4=30*s;
a5=(20-30*s);
a6=-20*s;
a7=0;
a8=20;
a9=-10;
T=[0;0;100*r];

A=[a1,a2,a3;a4,a5,a6;a7,a8,a9];

detp=det(A);
A(:,1)=T;

dets=det(A);

salida=dets/detp;
disp(salida)

salida=ilaplace(salida);

tt=0:.1:10;

salida=subs(salida,r,1);
for i=1:length(tt)
   dd(i)=subs(salida,t,tt(i)); 
end
plot(dd)
