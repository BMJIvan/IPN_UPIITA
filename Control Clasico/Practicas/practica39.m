clc
clear all
close all

t=0:.01:10;
m=1;
b=1;
k=1;

%w=1;
w=0:0.01:100;
for l=1:length(w)
    
s=w(l)*j;
G=1/(m*(s^2)+b*s+k);
M(l)=abs(G);
f(l)=angle(G);
yt=M(l)*sin(w(l)*t+f(l));
%plot(t,yt)
%axis([0 10 -5 5])
%drawnow
%pause(.1)

end

subplot(2,2,1)
semilogx(w,20*log10(M))

subplot(2,2,3)
semilogx(w,f*(180/pi))

subplot(2,2,[2 4])
bode(tf([1],[m b k]))
