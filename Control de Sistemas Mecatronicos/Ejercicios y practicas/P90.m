clc
clear all
close all

A=[0,-1,0,0,-4;0,0,1,0,1;0,1,0,0,2;-2,1,0,-2,4;0,0,0,0,-2];
B=[0;1;0;0;0];
C=[1,0,0,0,0];

L=size(B,1);

Mo=zeros(L,L);
for i=1:L
    Mo(i,:)=C*A^(i-1);
end
r=rank(Mo);
S(1:rank(A),:)=Mo(1:rank(A),:);
S(L,:)=[0,0,0,1,0];
rank(S)
det(S)

Sinv=inv(S);
As=S*A*Sinv;
Bs=S*B;
Cs=C*Sinv;

A11=As(1:r,1:r);
A21=As(r+1:L,1:r);
A22=As(r+1:L,r+1:L);

% lamo=sort(eig(A)');
% lamn=round(sort([eig(A11);eig(A22)]'));

syms Ll s

A=A11;
B=Bs(1:r);
C=Cs(1:r);

polos=[-3,-5,-2+2i,-2-2i,-2];
polos=polos(1:r);
L=size(B,1);
I=eye(L);
LL=sym(zeros(L,1));
for i=1:L
    LL(i)=Ll^(i+1);
end

pol=s-polos(1);
for i=2:L
   pol=pol*(s-polos(i)); 
end
pol=expand(pol);

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

pol=expand(det(s*I-(A-LL*C)));

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

ecu=zeros(L,L+1);
for i=1:L
    ann=an(i);
    for j=1:L
        ann=(subs(ann(1),Ll^(1+j),0));
    end
    ecu(i,L+1)=ann;
end

an=an-(ecu(:,L+1)');

cont=1;
for i=1:L
    for k=1:L
    ann=an(i);
        for j=1:L
            if(cont==k)
                ann=subs(ann,Ll^(1+j),1);
            else
                ann=subs(ann,Ll^(1+j),0);
            end
        cont=cont+1;
        end
    cont=1;
    ecu(i,k)=ann;
    end
end
disp(ecu)
ecu(:,L+1)=-ecu(:,L+1)+a';

ecup=ecu(:,1:(L));
detg=det(ecup);
Lln=zeros(1,L);
for i=1:L
   ecupp=ecup;
   ecupp(:,i)=ecu(:,L+1);
   detp=det(ecupp);
   Lln(i)=detp/detg;
end
Lln=Lln';
eig(A-Lln*C)

Llf=[Lln;0]
LLf=Sinv*Llf;

A=[0,-1,0,0,-4;0,0,1,0,1;0,1,0,0,2;-2,1,0,-2,4;0,0,0,0,-2];
B=[0;1;0;0;0];
C=[1,0,0,0,0];

disp(LLf)
eig(A-LLf*C)