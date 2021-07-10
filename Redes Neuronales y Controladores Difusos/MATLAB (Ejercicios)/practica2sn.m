clc
clear all
close all;

D=0:100;

a=10;
b=20;
c=30;
d=40;

figure,hold on
m1=trapezoidal(D,0,0,10,20);
m2=triangular(D,15,35,50);
m3=triangular(D,40,50,60);
m4=triangular(D,50,65,85);
m5=trapezoidal(D,80,90,100,100);
hold off
figure,hold on
m11=triangular(D,0,0,25);
m22=triangular(D,0,25,50);
m33=triangular(D,25,50,75);
m44=triangular(D,50,75,100);
m55=triangular(D,75,100,100);
hold off

x=17
Me=[m1(x+1) m2(x+1) m3(x+1) m4(x+1) m5(x+1)];

for k=1:length(D)
    if m1(k)>=m1(x+1)
        m1(k)=m1(x+1);
    end
     if m2(k)>=m2(x+1)
        m2(k)=m2(x+1);
     end
     if m3(k)>=m3(x+1)
        m3(k)=m3(x+1);
     end
     if m4(k)>=m4(x+1)
        m4(k)=m4(x+1);
     end
     if m5(k)>=m5(x+1)
        m5(k)=m5(x+1);
     end
   
end
%figure, hold on
%plot(D,m1)
%plot(D,m2)
%plot(D,m3)
%plot(D,m4)
%plot(D,m5)
nu=0:100;
nu=nu*0;
for k=1:length(D)
    if nu(k)<=m1(k)
        nu(k)=m1(k);
    end
     if nu(k)<=m2(k)
        nu(k)=m2(k);
     end
     if nu(k)<=m3(k)
        nu(k)=m3(k);
     end
     if nu(k)<=m4(k)
        nu(k)=m4(k);
     end
     if nu(k)<=m5(k)
        nu(k)=m5(k);
     end
end

figure,plot(D,nu)
centroide=sum(nu.*D)/sum(nu)

