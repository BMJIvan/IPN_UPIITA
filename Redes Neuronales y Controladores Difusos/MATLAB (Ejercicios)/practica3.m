clc
clear all
close all

D=0:100;
V=-100:100;

%figure,hold on
MC=trapezoidal(D,0,0,10,15);
C=triangular(D,10,25,40);
I=triangular(D,35,50,65);
L=triangular(D,50,75,90);
ML=trapezoidal(D,85,90,100,100);
%hold off

%figure,hold on
Ami=trapezoidal(V,-100,-100,-75,-50);
Mmi=triangular(V,-70,-45,0);
Zi=triangular(V,-10,0,15);
Mi=triangular(V,0,45,70);
Ai=trapezoidal(V,50,75,100,100);
%hold off

%figure,hold on
Amd=trapezoidal(V,-100,-100,-75,-50);
Mmd=triangular(V,-70,-45,0);
Zd=triangular(V,-10,0,15);
Md=triangular(V,0,45,70);
Ad=trapezoidal(V,50,75,100,100);
%hold off
close all

for x=1:length(D)
cla
Mi2=Mi;
Md2=Md;
for i=1:length(D)
   if D(i)==x
   Me=[MC(i) C(i) I(i) L(i) ML(i)]
   end
end

 %Mei=[Ami(i) Mmi(i) Zi(i) Mi(i) Ai(i)];
  % Med=[Amd(i) Mmd(i) Zd(i) Md(i) Ad(i)];
for i=1:length(V)
   if Ami(i)>=Me(1)
       Ami(i)=Me(1);
   end
    if Mmi(i)>=Me(2)
        Mmi(i)=Me(2);
     end
     if Mi(i)>=Me(3)
        Mi(i)=Me(3);
     end
     if Mi2(i)>=Me(4)
        Mi2(i)=Me(4);
     end
     
     if Ai(i)>=Me(5)
        Ai(i)=Me(5);
     end
      DIFUSA_motor_izquierda(i)=max([Ami(i) Mmi(i) Mi(i) Mi2(i) Ai(i)]);
end

for i=1:length(V)
   if Ad(i)>=Me(1)
       Ad(i)=Me(1);
   end
    if Md(i)>=Me(2)
        Md(i)=Me(2);
     end
     if Md2(i)>=Me(3)
        Md2(i)=Me(3);
     end
     if Mmd(i)>=Me(4)
        Mmd(i)=Me(4);
     end
     
     if Amd(i)>=Me(5)
        Amd(i)=Me(5);
     end
      DIFUSA_motor_derecha(i)=max([Amd(i) Mmd(i) Md(i) Md2(i) Ad(i)]);
end

centroide_izquierda=sum(DIFUSA_motor_izquierda.*V.*1)/sum(DIFUSA_motor_izquierda.*1);

hold on
Ami=trapezoidal(V,-100,-100,-75,-50);
Mmi=triangular(V,-70,-45,0);
Zi=triangular(V,-10,0,15);
Mi=triangular(V,0,45,70);
Mi2=Mi;
Ai=trapezoidal(V,50,75,100,100);
plot(V,DIFUSA_motor_izquierda,'kd')
stem([centroide_izquierda],[0.1],'k');
ft1(x)=centroide_izquierda;

Amd=trapezoidal(V,-100,-100,-75,-50);
Mmd=triangular(V,-70,-45,0);
Zd=triangular(V,-10,0,15);
Md=triangular(V,0,45,70);
Ad=trapezoidal(V,50,75,100,100);
centroide_derecha=sum(DIFUSA_motor_derecha.*V.*1)/sum(DIFUSA_motor_derecha.*1);
ft2(x)=centroide_derecha;
pause(.1)

if x==32
    graf_32_i=DIFUSA_motor_izquierda;
    graf_32_d=DIFUSA_motor_derecha; 
    centroide_32_i=centroide_izquierda;
    centroide_32_d=centroide_derecha;
end
if x==58
    graf_58_i=DIFUSA_motor_izquierda;
    graf_58_d=DIFUSA_motor_derecha; 
    centroide_58_i=centroide_izquierda;
    centroide_58_d=centroide_derecha;
end
end
hold off
figure,plot(D,ft1)
figure,plot(D,ft2)

figure,plot(V,graf_32_d,'kd')
figure,hold on 
plot(V,graf_32_d,'kd')
stem([centroide_32_d],[0.1],'k');
hold off

figure,plot(V,graf_32_i,'kd')
figure,hold on
plot(V,graf_32_i,'kd')
stem([centroide_32_i],[0.1],'k');
hold off

figure,plot(V,graf_58_d,'kd')
figure,hold on 
plot(V,graf_58_d,'kd')
stem([centroide_58_d],[0.1],'k');
hold off

figure,plot(V,graf_58_i,'kd')
figure,hold on
plot(V,graf_58_i,'kd')
stem([centroide_58_i],[0.1],'k');
hold off

 centroide_32_i
 centroide_32_d
 centroide_58_i
 centroide_58_d