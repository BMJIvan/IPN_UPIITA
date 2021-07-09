clc
clear all
close all

Av=[400,-899,1409,-399;200,-450,704,-198;0,0,0,1;0,1,0,0];
Bv=[1;0;0;1];
Cv=[1,-2,3,-1];

A=[Av,zeros(4,1);-Cv,0];
B=[Bv;0];

% n=size(B,1);
% I=eye(n);
% Mcon=zeros(n,n);
% for i=1:n
%     Mcon(:,i)=(A^(i-1)*B);
% end
% disp(rank(Mcon))
% Q=Mcon(:,1:4);
% Q(:,5)=[1;-1;-1;-1;1];
% 
% An=inv(Q)*(A*Q);
% Bn=inv(Q)*B;
% 
% A=An(1:4,1:4);
% B=Bn(1:4);
% C=Cv(1:4);
% n=size(B,1);

MP=11.5;
ts=.55;
mul=10;
n=size(A,1);

[nu,den]=ss2tf(Av,Bv,Cv,0);
tf(nu,den)
nu=roots(nu);
de=roots(den);

de=round(de*100)/100;
lu=length(nu);
le=length(de);

cont=0;
for i=1:le
    if(real(de(i))==0&&imag(de(i))==0)
        cont=cont+1;
    end
end
polos=zeros(1,n);

if cont>0
    %tiene integrador
    Zz=isempty(nu);
    if(Zz)
        %si no hay zeros
        polos(1:2)=RSL(MP,ts);
        mag=-mul*abs(polos(1));
        for i=1:n-2
            polos(i+2)=mag;
        end
    else
        polos(1:2)=RSL(MP,ts);
        num=n-2;
        mag=-mul*abs(polos(1));
        if(num==0)
        else
            for i=1:num
                if(i<=lu)
                    polos(i+2)=nu(i); 
                else
                    polos(i+2)=mug;
                end
            end
        end
    end
    
else
    polos(1:2)=RSL(MP,ts);
    num=n-2;
    mag=-mul*abs(polos(1));
    for i=1:num
        if(i<=lu)
                polos(i+2)=nu(i); 
        else
                polos(i+2)=mag;
        end
    end
end


n=size(B,1);
I=eye(n);
Mcon=zeros(n,n);
for i=1:n
    Mcon(:,i)=(A^(i-1)*B);
end
% disp(rank(Mcon))
Q=Mcon(:,1:n-1);
Q(:,5)=[-1,1,-1,1,-1];
% disp(rank(Q))
An=inv(Q)*A*Q;
Bn=inv(Q)*B;
polosn=polos(1:4);

A=An(1:4,1:4);
B=Bn(1:4);
mat=zeros(4,4);
mat(1,:)=KMD(A,B,polosn);
mat(2,:)=KFA(A,B,polosn);
mat(3,:)=KLy(A,B,polosn);
mat(4,:)=KFCC(A,B,polosn);
eig(A-B*mat(1,:))

Kf=zeros(4,5);
Kf(1,:)=[mat(1,:),0]*inv(Q);
Kf(2,:)=[mat(2,:),0]*inv(Q);
Kf(3,:)=[mat(3,:),0]*inv(Q);
Kf(4,:)=[mat(4,:),0]*inv(Q);

n=size(Av,1);
Mo=zeros(n,n);
for i=1:n
    Mo(i,:)=Cv*Av^(i-1);
end
disp(rank(Mo))
% Kp=K(1:n-1)
% KI=-K(n)

polos(:)=-abs((polos(1))*10);
L=zeros(4,4);

L(:,1)=LMD(Av,Cv,polos);
L(:,2)=LLy(Av,Cv,polos);
eig(Av-L(:,1)*Cv)