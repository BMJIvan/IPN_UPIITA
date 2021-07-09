clc
close all
clear all

syms s t u tao
c1=1;
c2=2;
r1=1;
r2=2;
u=10*sin(t);
A=[0,1,0,0;0,0,-1,0;0,0,0,1;0,0,5,0];
B=[0;1;0;-2];
C=[-1,0,0,0];
D=1;
x0=[1;1;0;0];

L=size(A,1);
I=eye(L);
%forma canonica controlable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

An=P*A*Pinv;
Bn=P*B;
Cn=C*Pinv;


%forma canonica oservable
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L=size(A,1);
I=eye(L);
Co=zeros(1,L);
Co(L)=1;

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

Ao=zeros(L,L);
for i=2:L
   Ao(i,i-1)=1; 
end
for i=1:L
   Ao(i,L)=-a(L-i+1); 
end

th=zeros(L,L);
for i=1:L
   th(i,:)=C*A^(i-1); 
end

thrinv=zeros(L,L);
for i=1:L
    for j=1:L
        if(i==j)
            thrinv(i,L+1-j)=1;
        end
    end
end

cont=L-1;
Ln=L;
for i=1:L
    for j=1:cont
        thrinv(i,j)=a(Ln-j); 
    end
    cont=cont-1;
    Ln=Ln-1;
end

Qinv=thrinv*th;
Q=inv(Qinv);

Aon=Qinv*Ao*Q;
Bon=Qinv*B;
Con=Co*Q;

z0=Qinv*x0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Us=10/(s^2+1);
dett=inv(s*I-A);
Pa=ilaplace(dett)*x0;
% Pb=ilaplace(det*B*(u/s));
Pb=ilaplace(dett*B*(Us));
xt=Pa+Pb;
yt=C*xt;
xtt=vpa(xt);
ytt=vpa(yt);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
disp(MatExp)

fun=C*MatExp*B*u;
y=int(fun,t,0,t);
% y=C*X;
y=simplify(y);

ME=ilaplace(inv(s*I-A))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MEt=vpa(MatExp);

MEtao=subs(MEt,t,-tao);
fun=MEt*MEtao*B*u;
Xsc=int(fun,tao,0,t);

Ct=subs(Xsc,t,0);
Cc=subs(Ct,u,0);
Xcc=Xsc-(Cc);

y=MatExp*x0+C*Xcc;
y=simplify(y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cr2=size(B,1);
Ck=[B A*B A^2*B A^3*B A^4*B A^5*B];
cr0=rank(Ck);
ck=ctrb(A,B);
cr1=rank(ck);
Ok=[C;C*A;C*A^2;C*A^3;C*A^4;C*A^5];
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