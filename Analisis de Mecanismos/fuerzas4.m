clc
clear all
close all
format long

b=1.12;
c=1.64;
d=2.76;
h=.45;
m=1600;
g=9.81;
velmax=100/3.6;
%en reposo
cfA=0;
cfB=0;
U=cfA*h-c;
N=cfB+b;
detA=N*m*g;
detB=-U*m*g;
det=N-U;
NA=detA/det
NB=detB/det
PA=NA/(m*g)
PB=NB/(m*g)

%traccion integral
cfA=.68;
cfB=.68;
U=cfA*h-c;
N=cfB+b;
detA=N*m*g;
detB=-U*m*g;
det=N-U;
NA=detA/det;
NB=detB/det;
acgx=((NA*cfA)+(NB*cfB))/(m)
t=velmax/acgx
PA=NA/(m*g)
PB=NB/(m*g)

%traccion trasera
cfA=.68;
cfB=0;
U=cfA*h-c;
N=cfB+b;
detA=N*m*g;
detB=-U*m*g;
det=N-U;
NA=detA/det;
NB=detB/det;
acgx=((NA*cfA)+(NB*cfB))/(m)
t=velmax/acgx
PA=NA/(m*g)
PB=NB/(m*g)

%traccion delantera
cfA=0;
cfB=.68;
U=cfA*h-c;
N=cfB+b;
detA=N*m*g;
detB=-U*m*g;
det=N-U;
NA=detA/det;
NB=detB/det;
acgx=((NA*cfA)+(NB*cfB))/(m)
t=velmax/acgx
PA=NA/(m*g)
PB=NB/(m*g)