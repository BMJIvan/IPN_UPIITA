clear all
close all
clc
format long

rad=pi/180;
grados=180/pi;
AD=4;
AB=2;
BC=5;
CD=5;
BCP=10;


t2=(0:10:360)*rad;
x=0:36;
y=0:36;
for n=1:37
BD=(((AD-AB*cos(t2(n)))^2)+((AB*sin(t2(n)))^2))^.5;
rho=asin((AB/BD)*sin(t2(n)));
delta=acos((BD^2+CD^2-BC^2)/(2*BD*CD));
t4=(pi)-(rho+delta);
t3=acos((CD*cos(t4)+AD-AB*cos(t2(n)))/(BC))

y(n)=AB*sin(t2(n))+BCP*sin(t3);
x(n)=AB*cos(t2(n))+BCP*cos(t3);
end

plot(x,y)



AB=15/1.845;
BC=AB*2.463;
AD=AB*1.974;
CD=BC;
BCP=2*BC;


t2=(0:10:360)*rad;
x=0:36;
y=0:36;
for n=1:37
BD=(((AD-AB*cos(t2(n)))^2)+((AB*sin(t2(n)))^2))^.5;
rho=asin((AB/BD)*sin(t2(n)));
delta=acos((BD^2+CD^2-BC^2)/(2*BD*CD));
t4=(pi)-(rho+delta);
t3=acos((CD*cos(t4)+AD-AB*cos(t2(n)))/(BC))

y(n)=AB*sin(t2(n))+BCP*sin(t3);
x(n)=AB*cos(t2(n))+BCP*cos(t3);
end

plot(x,y)



AB=20/3.623;
BC=AB*3.25;
AD=AB*2.5;
CD=BC;
BCP=2*BC;


t2=(0:10:360)*rad;
x=0:36;
y=0:36;
for n=1:37
BD=(((AD-AB*cos(t2(n)))^2)+((AB*sin(t2(n)))^2))^.5;
rho=asin((AB/BD)*sin(t2(n)));
delta=acos((BD^2+CD^2-BC^2)/(2*BD*CD));
t4=(pi)-(rho+delta);
t3=acos((CD*cos(t4)+AD-AB*cos(t2(n)))/(BC))

y(n)=AB*sin(t2(n))+BCP*sin(t3);
x(n)=AB*cos(t2(n))+BCP*cos(t3);
end

plot(x,y)
