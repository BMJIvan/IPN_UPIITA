function [K] = KFA(A,B,polos)
syms s

n=size(B,1);
I=eye(n);
Mcon=zeros(n,n);
for i=1:n
    Mcon(:,i)=(A^(i-1)*B);
end
disp(rank(Mcon))
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

PLC=A^n;
for i=2:n
PLC=PLC+(A^(n+1-i)*a(i-1));
end
PLCA=PLC+a(n)*I;

zer=zeros(1,n);
zer(n)=1;
K=zer*1/Mcon*PLCA;