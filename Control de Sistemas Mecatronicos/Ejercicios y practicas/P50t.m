clc
clear all
close all


A=[0,1,0,0;0,0,-1,0;0,0,0,1;0,0,5,0];
B=[0;1;0;-2];

syms s k1 k2 k3 k4
K=[k1,k2,k3,k4];

L=size(A,1);
I=eye(L);
%ubicacion de polos forma canonica controlable
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

Pinv=Con*Cri;
P=inv(Pinv);
Bc=zeros(L,1);
Bc(1)=1;

pol=expand(det(s*I-(A-B*K)));
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
Kr=(an-a);
disp(Kr)
Kr=K*Pinv;
disp(Kr)

K=subs(K,{k1,k2,k3,k4},{0,0,0,0});

%metodo directo
K=[k1,k2,k3,k4];
Md1=det(s*I-A);
Md2=expand(det(s*I-(A-Bc*K)));

%formula Ackerman
vecu=zeros(1,L);
vecu(L)=1;
PLCA=subs(Md2,s,A);
Coninv=inv(Con);
G=Coninv*PLCA;
% disp(vecu*G)
K=[0,4/3,0,2/3];

% eig(A-B*K)
% eig(P*(A-B*K)*Pinv)