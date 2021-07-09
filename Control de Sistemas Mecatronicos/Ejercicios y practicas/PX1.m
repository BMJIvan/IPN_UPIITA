clc
clear all
close all

A=[0,1,0,0
   -9/50,0,9/50,0
   0,0,0,1
   1,0,-1,-1];
B=[0;1/50;0;0];
C=[1,0,0,0];

MP=10.5;
ts=.44;
mul=5;
n=size(A,1);

[num,den]=ss2tf(A,B,C,0);
nu=roots(num);
de=roots(den);
%tf(num,den)

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
    
    
end
