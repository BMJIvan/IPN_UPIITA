clc
clear all
close all

e=-360:360;
m=gausiana(e,100,50);
m1=campana(e,50,1,-100);
m2=sigmoide(e,-.05,-280);
m3=singleton(e,-200);
hold on
plot(e,m)
plot(e,m1)
plot(e,m2)
stem(e,m3)