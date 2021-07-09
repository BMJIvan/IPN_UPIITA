clc
close all
A=[0,1,0,0;0,0,-1,0;0,0,0,1;0,0,5,0];
B=[0;1;0;-2];
C=[1,0,0,0];
D=[0];

syms s
I=eye(4);
det(s*I-A)

a1=0;
a2=-5;
a3=0;
a4=0;

Ar=[-a1,-a2,-a3,-a4;1,0,0,0;0,1,0,0;0,0,1,0];
% det(s*I-A)

Cri=[1,a1,a2,a3;0,1,a1,a2;0,0,1,a1;0,0,0,1];
Con=[B A*B (A^2)*B (A^3)*B];
Pinv=Con*Cri;
P=inv(Pinv);
ss2tf(A,B,C,D)

An=P*A*Pinv;
Bn=P*B;
Cn=C*Pinv;
ss2tf(An,Bn,Cn,D)

X=[0;0;0;0];
Xn=P*X;
dt=.1;
t=0:dt:10;
Xp=zeros(4,length(t));
Xpn=Xp;
y=zeros(1,length(t));
yn=y;
u=.1;
for i=1:length(t)
    Xp(:,i)=A*X+B*u;
    y(i)=C*X;
    X=sum(Xp*dt,2);
   
    Xpn(:,i)=An*Xn+Bn*u;
    yn(i)=Cn*Xn;
    Xn=sum(Xpn*dt,2);
end

subplot(2,2,1)
plot(t,y)
subplot(2,2,2)
plot(t,yn)

X=[1;1;1;1];
Xn=P*X;
dt=.1;
t=0:dt:10;
Xp=zeros(4,length(t));
Xpn=Xp;
y=zeros(1,length(t));
yn=y;
u=.1;
for i=1:length(t)
    Xp(:,i)=A*X+B*u;
    y(i)=C*X;
    X=sum(Xp*dt,2);
   
    Xpn(:,i)=An*Xn+Bn*u;
    yn(i)=Cn*Xn;
    Xn=sum(Xpn*dt,2);
end
subplot(2,2,3)
plot(t,y)
subplot(2,2,4)
plot(t,yn)