clc
close all

syms s t u

A=[1,2,1;0,1,2;0,0,1];
B=[1;0;0];
C=[1,0,0];

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

% clc
% close all
% 
% syms s t u
% 
% I=eye(1);
% A=[-25/18];
% B=[5/6];
% C=[1];
% 
% V=eig(A);
% L=length(V);
% I=eye(L);
% 
% cont=0;
% 
% syms e t la
% sec=sym('B%d%d',[L,L+1]);
% res=sym('B%d%d',[1,L]);
% sec(:,2)=1;
% 
% for n=1:L
%     la=V(n);
%     for k=1:n
%        if(V(n)==V(k))
%            cont=cont+1;
%        end
%     end
%     
%      if (imag(la)==0)
%         sec(n,1)=e^(la*t);
%      else
%         sec(n,1)=e^(real(la)*t)*(cos(imag(la)*t)+(1i*sin(imag(la)*t)));
%      end
%      
%     for p=3:L+1
%         sec(n,p)=la^(p-2);
%     end
%     
%     if(cont>1)
%         if(imag(la)==0)
%             sec(n,1)=(e^(la*t))*t^(cont-1);
%         else
%             sec(n,1)=((e^(real(la)*t))*(cos(imag(la)*t)+(1i*sin(imag(la)*t))))*t^(cont-1);
%         end
%         
%         for m=1:(cont-1)
%             sec(n,2:L+1)=diff(sec(n,2:L+1),la);
%         end
%     end
%     v=V(n);
% %     sec(n,:)=subs(sec(n,:),la,v);
%     cont=0;
% end
% 
% ecp=sec(:,2:(L+1));
% detp=det(ecp);
% 
% for n=1:L
%     ecpn=ecp;
%     ecpn(:,n)=sec(:,1);
%    res(n)=det(ecpn)/detp; 
% end
% 
% MatExp=res(1)*I;
% for n=1:L-1
%     MatExp=MatExp+(res(n+1)*(A^(n)));
% end
% 
% % MatExp=simplify(MatExp);
% disp(MatExp)
% % pretty(MatExp)
% % f=ilaplace(inv(s*I-A));
% % disp(f)
% 
% % B=[0;0;0;1/m2;0;0];
% % C=[0,0,0,1,0,0];
% 
% fun=C*MatExp*B*u;
% y=int(fun,t,0,t);
% % y=C*X;
% % y=simplify(y);
