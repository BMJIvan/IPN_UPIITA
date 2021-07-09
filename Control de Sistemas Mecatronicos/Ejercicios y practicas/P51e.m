clc
clear all
close all

syms s j2 j4 j10 k1 k2 k3 k4 k5 k6
%ejercicio 4 por metodo directo
A=[0,1,0,0,0,0
   16,0,-8,0,0,0
   0,0,0,1,0,0
   -16,0,16,0,0,0
   0,0,0,0,0,1
   0,0,0,0,0,0];
B=[0;-1;0;0;0;1];
K=[k1,k2,k3,k4,k5,k6];
L=size(B,1);
I=eye(L);

MD1=expand(det(s*I-(A-B*K)));
MD2=expand((s-(-10+2j))*(s-(-10-2j))*(s-(-10+4j))*(s-(-10-4j))*(s+5)*(s+20));

pol=MD1;
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
Ma1=a;

pol=MD2;
a=sym(zeros(1,L));
a(L)=subs(pol,s,0);
npol=pol-a(L);
b=sym(zeros(L,1));
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
b(k,1)=a(k);
end
Ma2=b;

ec=[0,-1,0,0,0,1
    -1,0,0,0,1,0
    0,16,0,16,0,-32
    16,0,16,0,-32,0
    0,0,0,0,0,128
    0,0,0,0,128,0];
cons=subs(Ma1,{k1,k2,k3,k4,k5,k6},{0,0,0,0,0,0});
Ma2=Ma2'-cons;

detp=det(ec);
MeDir=zeros(1,L);
ecpn=zeros(6,6);
for n=1:L
    ecpn=ec;
    ecpn(:,n)=Ma2;
   MeDir(n)=det(ecpn)/detp; 
end
disp(MeDir)
eig(A-B*MeDir)

%3 forma canocnica

A=[0,1,-1;0,1,2;5,3,-1];
B=[0;0;1];
K=[k1,k2,k3];
L=size(B,1);
I=eye(L);

pol=det(s*I-A);
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


Cri=zeros(L);
vec=[1,a(1:(L-1))];
for i=1:L
   Cri(i,:)=vec;
   for n=L-1:-1:1
       vec(n+1)=vec(n);
   end
   vec(1)=0;
end


Lb=size(B,2);
Con=zeros(L,L*Lb);
for i=1:L
    Con(:,(1+((i-1)*Lb)):(Lb+((i-1)*Lb)))=A^(i-1)*B;
end


pol=expand((s-(-4+j2))*(s-(-4-j2))*(s-(-10)));
an=sym(zeros(1,L));
an(L)=subs(pol,s,0);
npol=pol-an(L);

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
an(k)=nnpol;
end

Kr=an-a;

Pinv=Con*Cri;
P=inv(Pinv);
K=Kr*P;
disp(K)

%3 ackerman

A=[3,3,2;3,4,3;-2,-3,-1];
B=[5;20;20];
K=[k1,k2,k3];
L=size(B,1);
I=eye(L);


pol=expand((s-(-20+j10))*(s-(-20-j10))*(s-(-50)));
an=sym(zeros(1,L));
an(L)=subs(pol,s,0);
npol=pol-an(L);

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
an(k)=nnpol;
end
C=[B A*B A^2*B];
Cinv=inv(C);
PLCA=subs(pol,s,A);
vec=[0,0,1];
G=Cinv*PLCA