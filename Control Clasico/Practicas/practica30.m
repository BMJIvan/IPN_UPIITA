clc
clear all
close all

Ki=0;
Kd=0;
tfi=30;
dt=.01;
t0=0;
t=t0:dt:tfi;
Kp=1;

for Kp=0:15
cla
    hold on
H=tf([Kp],[1 6 5 Kp]);

y=step(H,t);
plot(t,y)
%pzmap(H)
pause(.1)
axis([t0 tfi 0 2])
title(num2str(Kp))

end

Pcr=2.8;
Kcr=30;
Kp=.6*Kcr;
Ti=(.5)*Pcr;
Ki=Kp/Ti;
Td=.125*Pcr;
Kd=Kp*Td;
