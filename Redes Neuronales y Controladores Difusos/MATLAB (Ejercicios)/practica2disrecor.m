clc
clear all
close all;

D=0:100;


m1=trapezoidal(D,0,0,10,20);
m2=triangular(D,15,35,50);
m3=triangular(D,40,50,60);
m4=triangular(D,50,65,85);
m5=trapezoidal(D,80,90,100,100);
%figure,hold on
%m11=triangular(D,0,0,25);
%m22=triangular(D,0,25,50);
%m33=triangular(D,25,50,75);
%m44=triangular(D,50,75,100);
%m55=triangular(D,75,100,100);
%hold off

close all

for x=0:length(D)-1
    cla
for i=1:length(D)
   if D(i)==x
   Me=[m1(i) m2(i) m3(i) m4(i) m5(i)];
   end
end
for k=1:length(D)
    if m1(k)>=Me(1)
        m1(k)=Me(1);
    end
     if m2(k)>=Me(2)
        m2(k)=Me(2);
     end
     if m3(k)>=Me(3)
        m3(k)=Me(3);
     end
     if m4(k)>=Me(4)
        m4(k)=Me(4);
     end
     if m5(k)>=Me(5)
        m5(k)=Me(5);
     end
   DIFUSA(k)=max([m1(k) m2(k) m3(k) m4(k) m5(k)]);
end

centroide=sum(DIFUSA.*D.*1)/sum(DIFUSA.*1);
hold on
m1=trapezoidal(D,0,0,10,20);
m2=triangular(D,15,35,50);
m3=triangular(D,40,50,60);
m4=triangular(D,50,65,85);
m5=trapezoidal(D,80,90,100,100);
plot(D,DIFUSA,'kd')
stem([centroide],[0.1],'k');

ft(x+1)=centroide;
pause(.025)
end
hold off
figure,plot(D,ft)