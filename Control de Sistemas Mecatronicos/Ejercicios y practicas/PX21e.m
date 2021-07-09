clc
clear all
close all

Av=[-1,2,-2,0,0,0,0,0
    0,-1,2,0,0,0,0,0
    0,-2,-1,0,0,0,0,0
    1,0,0,-2,1,0,0,0
    -1,-2,2,-1,-2,0,0,0
    0,-49,-2,0,0,-50,0,0
    0,2,-49,2,0,0,-50,2
    -1,0,-2,-48,-1,0,-2,-50];
Bv=[0;1;0;1;0;-1;0;-1];
Cv=[2,0,1,1,1,0,1,0];


[nu,den]=ss2tf(Av,Bv,Cv,0);
tf(nu,den)
nu=roots(nu);
de=roots(den);

A=[Av,zeros(8,1);-Cv,0];
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

MP=10.5;
ts=.44;
mul=8;
n=size(A,1);


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
Q=Mcon(:,1:6);
Q(:,7)=[-1,0,-1,1,-1,1,-1,1,1];
% disp(rank(Q))
Q(:,8)=[1,1,-1,0,-1,1,-1,1,-1];
% disp(rank(Q))
Q(:,9)=[-1,-1,1,0,-1,-1,-1,-1,-1];
disp(rank(Q))
Anc=inv(Q)*A*Q;
Bnc=inv(Q)*B;
polosn=polos(1:6);
polosn(5)=conj(polosn(6));
polosn(5)=polos(8);
polosn(6)=polos(9);
polosn(3)=nu(4);
polosn(4)=nu(5);
% polosn(1)=nu(1);
% polosn(2)=nu(2);
Ac=Anc(1:6,1:6);
Bc=Bnc(1:6);
mat=zeros(4,6);
mat(1,:)=KMD(Ac,Bc,polosn);
mat(2,:)=KFA(Ac,Bc,polosn);
mat(3,:)=KLy(Ac,Bc,polosn);
mat(4,:)=KFCC(Ac,Bc,polosn);
eig(Ac-Bc*mat(1,:))

Kf=zeros(4,9);
Kf(1,:)=[mat(1,:),0,0,0]*inv(Q);
Kf(2,:)=[mat(2,:),0,0,0]*inv(Q);
Kf(3,:)=[mat(3,:),0,0,0]*inv(Q);
Kf(4,:)=[mat(4,:),0,0,0]*inv(Q);


n=size(Av,1);
Mo=zeros(n,n);
S=Mo;
for i=1:n
    Mo(i,:)=Cv*Av^(i-1);
end
disp(rank(Mo))
S(1:7,:)=Mo(1:7,:);
S(8,:)=[1,-1,-1,1,1,-1,-1,1];
disp(rank(S))

A=S*Av*inv(S);
B=S*Bv;
C=Cv*inv(S);

An=A(1:7,1:7);
Cn=C(1:7);

polosnl(1:7)=-(abs(polos(1)))*10;
L=zeros(7,4);
polosnl=polos(3:9)
polosnl(3)=-10*abs(polos(1))
L(:,1)=LMD(An,Cn,polosnl);
L(:,2)=LLy(An,Cn,polosnl);
L(:,3)=LFCO(An,Cn,polosnl);
L(:,4)=LFA(An,Cn,polosnl);
eig(An-L(:,1)*Cn)

Lf=zeros(8,4);
Lf(:,1)=inv(S)*[L(:,1);0];
Lf(:,2)=inv(S)*[L(:,2);0];
Lf(:,3)=inv(S)*[L(:,3);0];
Lf(:,4)=inv(S)*[L(:,4);0];
