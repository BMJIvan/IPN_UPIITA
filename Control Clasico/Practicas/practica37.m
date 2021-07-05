clc
clear all
close all

a=1;
num=[1];
%den=[1 [5 4 2 1 .5 .1 0 -.5 -1] 1];tarea
win=.01;
wf=100;

for w=0:win:wf
for i=1:length(num)
    numt(i)=((w*j)^(length(num)-i))*num(i);
end
for i=1:length(den)
    dent(i)=((w*j)^(length(den)-i))*den(i);
end
ft=(sum(numt))/(sum(dent));
ima=imag(ft);
rea=real(ft);
ytt(a)=sqrt(ima^2+rea^2);
ytp(a)=angle(ft)*180/pi;
% if ytp(a)>0
%     ytp(a)=ytp(a)-360;
% end
a=a+1;
end

w=0:win:wf;
Gs=tf(num,den);
subplot(2,2,1)
semilogx(w,20*log10(ytt),'b')
subplot(2,2,3)
semilogx(w,ytp,'r')
subplot(2,2,[2 4])
bode(Gs)