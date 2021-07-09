clc
close all
clear all

syms s t u tao


A=[0,1,0,0;0,0,-1,0;0,0,0,1;0,0,5,0];
B=[0;1;0;-2];
C=[1,0,0,0];
x0=[1;2;3;4];

L=size(A,1);
I=eye(L);
Co=zeros(1,L);
Co(L)=1;

pol=expand(det(s*I-A));
a=sym(zeros(1,L));
a(L)=subs(pol,s,0);
npol=pol-a(L);

for k=1:L-1
nnpol=npol;
cont=L-k;
for i=L:-1:1
    if i==cont
        nnpol=subs(nnpol,s^i,1);
    else
        nnpol=subs(nnpol,s^i,0);
    end
end
a(k)=nnpol;
end

Ao=zeros(L,L);
for i=2:L
   Ao(i,i-1)=1; 
end
for i=1:L
   Ao(i,L)=-a(L-i+1); 
end

th=zeros(L,L);
for i=1:L
   th(i,:)=C*A^(i-1); 
end

thrinv=zeros(L,L);
for i=1:L
    for j=1:L
        if(i==j)
            thrinv(i,L+1-j)=1;
        end
    end
end

cont=L-1;
Ln=L;
for i=1:L
    for j=1:cont
        thrinv(i,j)=a(Ln-j); 
    end
    cont=cont-1;
    Ln=Ln-1;
end

Qinv=thrinv*th;
Q=inv(Qinv);

Aon=Qinv*Ao*Q;
Bon=Qinv*B;
Con=Co*Q;

z0=Qinv*x0;
ss2tf(Ao,B,Co,0)
ss2tf(Aon,Bon,Con,0)

z=Qinv*x0;
dt=.1;
t=0:dt:10;
Xp=zeros(4,length(t));
Xpn=Xp;
y=zeros(1,length(t));
yn=y;
u=0;
for i=1:length(t)
    Xp(:,i)=Ao*x0+B*u;
    y(i)=Co*x0;
    X=sum(Xp*dt,2);
   
    Xpn(:,i)=Aon*z+Bon*u;
    yn(i)=Con*z;
    Xn=sum(Xpn*dt,2);
end

subplot(2,2,1)
plot(t,y)
subplot(2,2,2)
plot(t,yn)
