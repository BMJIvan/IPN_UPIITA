clc
clear all
close all

RE=-10:.1:10;
a1=(tan(pi/3))*(RE+11/3);
a2=(tan(pi))*(RE);
a3=(tan(5*pi/3))*(RE+11/3);
hold on
for k=-500:500
r=roots([1 11 44 34+k]);
plot([real(r)],[imag(r)],'o')
plot([-100 100],[0 0],'k')
plot([0 0],[-100 100],'k')
plot(RE,a1)
plot(RE,a2)
plot(RE,a3)
title(num2str(k))
drawnow
axis([-10 10 -10 10])
end