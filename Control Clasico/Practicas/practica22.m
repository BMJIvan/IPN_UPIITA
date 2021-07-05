clc
clear all
close all

t0=0;
tfi=10;
dt=.01;
t=t0:dt:tfi;

% m=1;
% k=1;
% b=10;
% wn=sqrt(k/m);
% Z=b/(2*sqrt(m)*sqrt(k));
k=1;
wn=1;

%hold on
cla
for Z=10:-0.1:0;
Gs=tf([k*wn^2],[1 2*Z*wn wn^2]);
y=step(Gs,t);
plot(t,y)
axis([0 10 0 2])
%title(num2str(Z))
title(num2str(roots([1 2*Z*wn wn^2])))
%drawnow
pause(.1)
end