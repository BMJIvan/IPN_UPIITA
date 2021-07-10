clc
clear all
close all;

D=0:100;
m1=trapezoidal(D,0,0,10,20);
m2=triangular(D,15,35,50);
m3=triangular(D,40,50,60);
m4=triangular(D,50,65,85);
m5=trapezoidal(D,80,90,100,100);

V=0:100;
m11=triangular(V,0,0,25);
m22=triangular(V,0,25,50);
m33=triangular(V,25,50,75);
m44=triangular(V,50,75,100);
m55=triangular(V,75,100,100);


close all

for x=0:length(V)-1
    cla
for i=1:length(V)
   if D(i)==x
   Me=[m1(i) m2(i) m3(i) m4(i) m5(i)];
   end
end
for k=1:length(V)
    if m11(k)>=Me(1)
        m11(k)=Me(1);
    end
     if m22(k)>=Me(2)
        m22(k)=Me(2);
     end
     if m33(k)>=Me(3)
        m33(k)=Me(3);
     end
     if m44(k)>=Me(4)
        m44(k)=Me(4);
     end
     if m55(k)>=Me(5)
        m55(k)=Me(5);
     end
   DIFUSA(k)=max([m11(k) m22(k) m33(k) m44(k) m55(k)]);
end

centroide=sum(DIFUSA.*V.*1)/sum(DIFUSA.*1);
hold on
m11=triangular(V,0,0,25);
m22=triangular(V,0,25,50);
m33=triangular(V,25,50,75);
m44=triangular(V,50,75,100);
m55=triangular(V,75,100,100);
plot(V,DIFUSA,'kd')
stem([centroide],[0.1],'k');

ft(x+1)=centroide;
pause(.025)
end
hold off
figure,plot(V,ft)
    
    