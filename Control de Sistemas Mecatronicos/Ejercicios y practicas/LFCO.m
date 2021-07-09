function [Ll] = LFCO(A,C,polos)

syms s Ll
L=size(A,1);
I=eye(L);

pol=s-polos(1);
for i=2:L
   pol=pol*(s-polos(i)); 
end
pol=expand(pol);

ar=sym(zeros(1,L));
ar(L)=subs(pol,s,0);
npol=pol-ar(L);

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
ar(k)=nnpol;
end

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

Mo=zeros(L,L);
for i=1:L
    Mo(i,:)=C*A^(i-1);
end

Ma=zeros(L,L);
i=1;
j=L;
for k=1:L
    Ma(i,j)=1;
    i=i+1;
    j=j-1;
end

for k=1:L-1
    i=1;
    j=L-k;
    for m=1:L-k
    Ma(i,j)=a(k);
    i=i+1;
    j=j-1;
    end
end
Qinv=Ma*Mo;

Lr=zeros(L,1);
for i=L:-1:1
    Lr((L+1)-i)=ar(i)-a(i);
end
Ll=Qinv\Lr;