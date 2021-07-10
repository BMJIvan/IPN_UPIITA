clc

m1=trapezoidal(x,0,0,10,20);
m2=triangular(x,15,35,50);
m3=triangular(x,40,50,60);
m4=triangular(x,50,65,80);
m5=trapezoidal(x,80,90,100,100);
M=[m1 m2 m3 m4 m5]