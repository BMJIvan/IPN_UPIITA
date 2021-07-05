clc
clear all
close all

t=0:.01:10;
hold on
a=1;
b=1;


num=[1];
den=[1 1];
Gs=tf(num,den);

for i=1:length(num)
    numt(i)=((w*j)^(i-1))*num(i);
end

for i=1:length(den)
    dent(i)=((w*j)^(i-1))*den(i);
end



for w=0:.01:100
%w=2*pi*5;
%cla
wm=0:.5:10;
xt=sin(w*t);
num=[1];
den=[1 1];
Gs=tf(num,den);
yt=lsim(Gs,xt,t);
ytt(a)=1/(sqrt(w*w+1));
%plot(t,xt,'r')
ytt(a)=20*log10(ytt(a));
ytp(b)=atan(-w)*180/pi;
wa(a)=log10(w);
wb(b)=log10(w);

a=a+1;
b=b+1;
end

subplot(2,2,1)
plot(wa,ytt,'*b')
%drawnow
subplot(2,2,3)

plot(wb,ytp,'*r')
subplot(2,2,[2 4])
bode(Gs)