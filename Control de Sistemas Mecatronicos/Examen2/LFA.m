function [Ll] = LFA(A,C,polos)

syms s Ll

L=size(A,1);
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

Mo=zeros(L,L);
for i=1:L
    Mo(i,:)=C*A^(i-1);
end

PobsA=A^L;
for i=1:L
PobsA=PobsA+ar(i)*A^(L-i);
end
th=zeros(L,1);
th(L)=1;
Ll=PobsA/Mo*th;