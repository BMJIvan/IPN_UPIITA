clc
clear all
close all

A=-25:25;
V=-100:100;

An=trapezoidal(A,-25,-25,-15,0);
neutro=triangulA(D,-5,0,5);
Ap=trapezoidal(A,0,15,25,25);

vni=trapezoidal(V,-100,-100,-75,0);
vdi=triangular(V,-10,0,10);
vpi=trapezoidal(V,0,75,100,100);

vnd=trapezoidal(V,-100,-100,-75,0);
vdd=triangular(V,-10,0,10);
vpd=trapezoidal(V,0,75,100,100);


close all

%for x=1:length(D)
%cla

for i=1:length(D)
   if D(i)==x
   Me=[An(i) neutro(i) Ap(i)];
   end
end

for i=1:length(V)
   if vni(i)>=Me(1)
       vni(i)=Me(1);
   end
   if vdi(i)>=Me(2)
      vdi(i)=Me(2);
   end
   if vpi(i)>=Me(3)
      vpi(i)=Me(3);
   end
  
      DIFUSA_motor_izquierda(i)=max([vni(i) vdi(i) vpi(i)]);
end

for i=1:length(V)
  if vni(i)>=Me(1)
       vni(i)=Me(1);
   end
   if vdi(i)>=Me(2)
      vdi(i)=Me(2);
   end
   if vpi(i)>=Me(3)
      vpi(i)=Me(3);
   end
  
      DIFUSA_motor_derecha(i)=max([vni(i) vdi(i) vpi(i)]);
end
%motor izquierdo
centroide_izquierda=sum(DIFUSA_motor_izquierda.*V.*1)/sum(DIFUSA_motor_izquierda.*1);
vni=trapezoidal(V,-100,-100,-75,0);
vdi=triangular(V,-10,0,10);
vpi=trapezoidal(V,0,75,100,100);
ft_i(x)=centroide_izquierda;

%motor derecho
centroide_derecha=sum(DIFUSA_motor_derecha.*V.*1)/sum(DIFUSA_motor_derecha.*1);
vnd=trapezoidal(V,-100,-100,-75,0);
vdd=triangular(V,-10,0,10);
vpd=trapezoidal(V,0,75,100,100);
ft_d(x)=centroide_derecha;


end
close all
figure,plot(D,ft_i)
figure,plot(D,ft_d)

