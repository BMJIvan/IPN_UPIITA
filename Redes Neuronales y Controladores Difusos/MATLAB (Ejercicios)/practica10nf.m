clc
clear all
close all

E=-360:360;
V=-100:100;

mi1=sigmoide(E,-.1,-280);
mi2=gausiana(E,-200,50);
mi3=gausiana(E,-100,50);
mi4=gausiana(E,0,5);
mi5=gausiana(E,100,50);
mi6=gausiana(E,200,50);
mi7=sigmoide(E,.1,280);

mo1=sigmoide(V,-.35,-85);
mo2=gausiana(V,-66.6,10);
mo3=gausiana(V,-33.3,10);
mo4=gausiana(V,0,5);
mo5=gausiana(V,33.3,10);
mo6=gausiana(V,66.6,10);
mo7=sigmoide(V,.35,85);
% 
% figure,hold on
% plot(E,mi1)
% plot(E,mi2)
% plot(E,mi3)
% plot(E,mi4)
% plot(E,mi5)
% plot(E,mi6)
% plot(E,mi7)
% hold off
% 
% figure,hold on
% plot(V,mo1)
% plot(V,mo2)
% plot(V,mo3)
% plot(V,mo4)
% plot(V,mo5)
% plot(V,mo6)
% plot(V,mo7)
% hold off

close all
%entrada=127;
n=1;
 for entrada=-360:360      
for i=1:length(E)
   if E(i)==entrada
   M=[mi1(i) mi2(i) mi3(i) mi4(i) mi5(i) mi6(i) mi7(i)];
   end
end


MC1=M(1)*mo1;
MC2=M(2)*mo2;
MC3=M(3)*mo3;
MC4=M(4)*mo4;
MC5=M(5)*mo5;
MC6=M(6)*mo6;
MC7=M(7)*mo7;
for i=1:length(V)
DIFUSA(i)=max([MC1(i) MC2(i) MC3(i) MC4(i) MC5(i) MC6(i) MC7(i)]);
end

[Y,I]=max(DIFUSA);

f=[-100 -66.6 -33.3 0 33.3 66.6 100];
salida1(n)=sum(V.*DIFUSA)/sum(DIFUSA);
salida2(n)=sum(f.*M)/sum(M);
salida3(n)=V(I);

tran1(entrada+361)=salida1(n);
tran2(entrada+361)=salida2(n);
tran3(entrada+361)=salida3(n);
n=n+1;
 end
 hold on
 plot(E,tran1)
 plot(E,tran2)
 plot(E,tran3)
 