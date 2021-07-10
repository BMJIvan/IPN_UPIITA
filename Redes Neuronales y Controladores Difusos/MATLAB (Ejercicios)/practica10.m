clc
clear all
close all

E=-360:360;
V=-100:100;

mi1=trapezoidal(E,-360,-360,-300,-200);
mi2=triangular(E,-300,-200,-100);
mi3=triangular(E,-200,-100,0);
mi4=triangular(E,-10,0,10);
mi5=triangular(E,0,100,200);
mi6=triangular(E,100,200,300);
mi7=trapezoidal(E,200,300,360,360);

mo1=triangular(V,-100,-100,-66.6);
mo2=triangular(V,-100,-60.6,-33.3);
mo3=triangular(V,-66.6,-33.3,0);
mo4=triangular(V,-10,0,10);
mo5=triangular(V,0,33.3,66.6);
mo6=triangular(V,33.3,66.6,100);
mo7=triangular(V,66.6,100,100);

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
 t1=table(salida1');
 t2=table(salida2');
 t3=table(salida3');
 ruta1='E:\semestre 5\sistemas neurodifusos\matlab\t1.txt';
 ruta2='E:\semestre 5\sistemas neurodifusos\matlab\t2.txt';
 ruta3='E:\semestre 5\sistemas neurodifusos\matlab\t3.txt';
 
 writetable(t1,ruta1);
 writetable(t2,ruta2);
 writetable(t3,ruta3);