function [Kr] = KMD(A,B,polos)
%KMD
syms kk s
n=size(A,1);
I=eye(n);
KK=sym(zeros(1,n));
for i=1:n
    KK(i)=kk^(i+1);
end

MD1=expand(det(s*I-(A-B*KK)));
MD2=s-polos(1);
for i=2:n
    MD2=MD2*(s-polos(i));
end
MD2=expand(MD2);

ar=sym(zeros(1,n));
ar(n)=subs(MD1,s,0);
npol=MD1-ar(n);

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

a=sym(zeros(1,n));
a(n)=subs(MD2,s,0);
npol=MD2-a(n);

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

ecu=zeros(n,n+1);
for i=1:n
    arr=ar(i);
    for j=1:n
        arr=(subs(arr,kk^(1+j),0));
    end
    ecu(i,n+1)=arr;
end

ar=ar-(ecu(:,n+1)');

cont=1;
for i=1:n
    for k=1:n
    arr=ar(i);
        for j=1:n
            if(cont==k)
                arr=subs(arr,kk^(1+j),1);
            else
                arr=subs(arr,kk^(1+j),0);
            end
        cont=cont+1;
        end
    cont=1;
    ecu(i,k)=arr;
    end
end

ecu(:,n+1)=-ecu(:,n+1)+a';

ecup=ecu(:,1:(n));
detg=det(ecup);
Kr=zeros(1,n);
for i=1:n
   ecupp=ecup;
   ecupp(:,i)=ecu(:,n+1);
   detp=det(ecupp);
   Kr(i)=detp/detg;
end