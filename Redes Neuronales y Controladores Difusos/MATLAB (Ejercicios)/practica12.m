clc
clear all
close all

E=-360:360;
V=-100:100;

mi1=trapezoidal(E,-360,-360,-300,-200);
mi2=triangular(E,-300,-200,-100);
mi3=triangular(E,-200,-100,0);
mi4=triangular(E,-10,0,10);
mi5=triangular(E,0,100,200);
mi6=triangular(E,100,200,300);
mi7=trapezoidal(E,200,300,360,360);
