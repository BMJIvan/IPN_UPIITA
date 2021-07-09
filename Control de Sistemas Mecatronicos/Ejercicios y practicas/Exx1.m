clc
close all
clear all

syms s t u tao
c1=1;
c2=2;
r1=1;
r2=2;

A=[(-1/c1)*((r1+r2)/(r1*r2)),-1/(c1*r2)
    -1/(c2*r2),-1/(c2*r2)];
B=[(1/c1)*((r2+r1)/(r1*r2));1/(c2*r2)];
C=[0 -1];
D=1;
x0=[1;1];
u=10*sin(t);

L=size(A,1);
I=eye(L);

cr2=size(B,1);
Ck=[B A*B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A];
co0=rank(Ok);
co=obsv(A,C);
co1=rank(co);
if(cr2==cr1&&cr1==cr2)
    disp('controlable')
else
    disp('no controlable')
end
if(cr0==co0&&cr0==co1)
    disp('observable')
else
    disp('no observable')
end

Us=10/(s^2+1);
dett=inv(s*I-A);
Pa=ilaplace(dett)*x0;
% Pb=ilaplace(det*B*(u/s));
Pb=ilaplace(dett*B*(Us));
xt=Pa+Pb;
yt=C*xt+D*u;
xtt=vpa(xt);
ytt=vpa(yt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V=eig(A);
L=length(V);
I=eye(L);

cont=0;
syms e t la
sec=sym('B%d%d',[L,L+1]);
res=sym('B%d%d',[1,L]);
sec(:,2)=1;

for n=1:L
%     la=V(n);
    for k=1:n
       if(V(n)==V(k))
           cont=cont+1;
       end
    end
    
     if (imag(la)==0)
        sec(n,1)=e^(la*t);
     else
        sec(n,1)=e^(real(la)*t)*(cos(imag(la)*t)+(1i*sin(imag(la)*t)));
     end
     
    for p=3:L+1
        sec(n,p)=la^(p-2);
    end
    
    if(cont>1)
        if(imag(la)==0)
            sec(n,1)=(e^(la*t))*t^(cont-1);
        else
            sec(n,1)=((e^(real(la)*t))*(cos(imag(la)*t)+(1i*sin(imag(la)*t))))*t^(cont-1);
        end
        
        for m=1:(cont-1)
            sec(n,2:L+1)=diff(sec(n,2:L+1),la);
        end
    end
    v=V(n);
    sec(n,:)=subs(sec(n,:),la,v);
    cont=0;
end

ecp=sec(:,2:(L+1));
detp=det(ecp);

for n=1:L
    ecpn=ecp;
    ecpn(:,n)=sec(:,1);
   res(n)=det(ecpn)/detp; 
end

MatExp=res(1)*I;
for n=1:L-1
    MatExp=MatExp+(res(n+1)*(A^(n)));
end
%disp(MatExp)

MEt=vpa(MatExp);
% MEt=ilaplace(inv(s*I-A));

MEt=simplify(MEt);
C=[1,0;0,1;0,-1];
D=[0;0;1];

MEtao=subs(MEt,t,-tao);
un=subs(u,t,tao);
fun=MEt*MEtao*B*un;
Xsc=int(fun,tao,0,t);
Xsc=MEt*x0+Xsc;
Ct=subs(Xsc,t,0);
Cc=x0-Ct;
Xsc=subs(Xsc,e,exp(1));

y=C*Xsc+D*u;

% ME=ilaplace(inv(s*I-A))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%