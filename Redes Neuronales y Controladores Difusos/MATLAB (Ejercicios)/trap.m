clc
clear all
close all
D=0:100;
hold on


m1=trapezoidal(D,0,0,10,20);
m2=triangular(D,15,35,50);
m3=triangular(D,40,50,60);
m4=triangular(D,50,65,85);
m5=trapezoidal(D,80,90,100,100);
V=0:100;
ms1=triangular(V,0,0,25);
ms2=triangular(V,0,25,50);
ms3=triangular(V,25,50,75);
ms4=triangular(V,50,75,100);
ms5=triangular(V,75,100,100);
for d=0:100;
    cla


for l=1:length(D)
   if D(l)==d
   M=[m1(l) m2(l) m3(l) m4(l) m5(l)]
   end
end

for l=1:length(V)
  MC1(l)=ms1(l)*M(1);
  MC2(l)=ms2(l)*M(2);
  MC3(l)=ms3(l)*M(3);
  MC4(l)=ms4(l)*M(4);
  MC5(l)=ms5(l)*M(5);
   DIFUSA(l)=max([MC1(l) MC2(l) MC3(l) MC4(l) MC5(l)]);
end
centroide=sum(DIFUSA.*V.*1)/sum(DIFUSA.*1)


%for l=1:length(V)
 %    if MC1(l)>=MC2(l)&& MC1(l)>=MC3(l) && MC1(l)>=MC4(l) && MC1(l)>=MC5(l)
  %      MG(l)=MC1(l);
  %   elseif MC2(l)>=MC1(l)&& MC2(l)>=MC3(l) && MC2(l)>=MC4(l) && MC2(l)>=MC5(l)
  %     MG(l)=MC2(l);
  %   elseif MC3(l)>=MC1(l)&& MC3(l)>=MC2(l) && MC3(l)>=MC4(l) && MC3(l)>=MC5(l)
  %     MG(l)=MC3(l);
  %   elseif MC4(l)>=MC1(l)&& MC4(l)>=MC3(l) && MC4(l)>=MC2(l) && MC4(l)>=MC5(l)
  %     MG(l)=MC4(l);
  %   elseif MC5(l)>=MC1(l)&& MC5(l)>=MC3(l) && MC5(l)>=MC4(l) && MC5(l)>=MC2(l)
  %     MG(l)=MC5(l);
  %   end
%end

% figure
% hold on
% plot(D,m1)
% plot(D,m2)
% plot(D,m3)
% plot(D,m4)
% plot(D,m5)
% hold off

plot(V,ms1)
plot(V,ms2)
plot(V,ms3)
plot(V,ms4)
plot(V,ms5)
plot(V,DIFUSA,'kd')
stem([centroide],[0.1],'k');
pause(.1)
ft(d+1)=centroide;
end
hold off
figure
plot(D,ft)


% figure
% hold on
% plot(V,MC1)
% plot(V,MC2)
% plot(V,MC3)
% plot(V,MC4)
% plot(V,MC5)
% hold off
% 
% figure
% hold on
% plot(V,MG)
% 
% hold off


