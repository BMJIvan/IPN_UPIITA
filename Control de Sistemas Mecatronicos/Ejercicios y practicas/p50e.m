clc
clear all
close all

syms k1 k2 s j2


A=[1,3;3,1];
B=[1;0];
K=[k1,k2];
C=[1,0];

u=1;
dt=.1;
t=0:dt:10;

X=[0;0];
Xp=zeros(2,length(t));
y=zeros(1,length(t));
for i=1:length(t)
   Xp(:,i)=A*X+B*u;
   y=C*X;
   X=sum(Xp*dt,2);
end
subplot(2,1,1),plot(t,y)

val=(s+1+j)*(s+1-j);
de=det(s*eye(2)-(A-B*K));
subs(K,{k1,k2},{4,14/3})

K=[4,14/3];
r=1;
X=[0;0];
Xp=zeros(2,length(t));
yn=zeros(1,length(t));
for i=1:length(t)
   u=r-K*X;
   Xp(:,i)=A*X+B*u;
   yn=C*X;
   X=sum(Xp*dt,2);
end
subplot(2,1,2),plot(t,yn)

K=[k1,k2];
val=(s-1)*(s-.5);
de=det(s*eye(2)-(A-B*K));