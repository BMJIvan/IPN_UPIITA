clc
% clear all
close all

A=[0,1,0,0;0,0,-1,0;0,0,0,1;0,0,5,0];
B=[0;1;0;-2];
C=[1,0,0,0];
% D=[0];

vs=size(B,1);
I=eye(vs);

syms s
pol=det(s*I-A);
a=sym(zeros(1,vs));
val=pol;
a(vs)=subs(val,s,0);
val=val-a(vs);


cont=vs-1;
for n=1:vs-1
aval=val;
for i=vs:-1:1
    
    if(i==cont)
    aval=subs(aval,s^i,1);
    else
    aval=subs(aval,s^i,0);
    end
end
a(cont)=aval;
cont=cont-1;
end