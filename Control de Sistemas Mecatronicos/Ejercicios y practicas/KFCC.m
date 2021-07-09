function [K] = KFCC(A,B,polos)
%KFCC
syms s
n=size(B,1);

pol=s-polos(1);
for i=2:n
   pol=pol*(s-polos(i)); 
end
pol=expand(pol);

a=sym(zeros(1,n));
a(n)=subs(pol,s,0);
npol=pol-a(n);

for k=1:n-1
nnpol=npol;
cont=n-k;
for i=n:-1:1
    if i==cont
        nnpol=subs(nnpol,s^i,1);
    else
        nnpol=subs(nnpol,s^i,0);
    end
end
a(k)=nnpol;
end

I=eye(n);
Mcon=zeros(n,n);
for i=1:n
    Mcon(:,i)=(A^(i-1)*B);
end

MF=expand(det(s*I-A));
pol=MF;
ar=sym(zeros(1,n));
ar(n)=subs(MF,s,0);
npol=pol-ar(n);

for k=1:n-1
nnpol=npol;
cont=n-k;
for i=n:-1:1
    if i==cont
        nnpol=subs(nnpol,s^i,1);
    else
        nnpol=subs(nnpol,s^i,0);
    end
end
ar(k)=nnpol;
end

MFC=I;
for i=1:n-1
    ai=ar(i);
    for j=1:n-i
        MFC(j,j+i)=ai;
    end
end

Pinv=Mcon*MFC;
Kr=a-ar;
K=Kr/Pinv;