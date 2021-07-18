clc
%clear all
close all
o=5;
f=3300;
for to=1:1
ima1=imread('E:\semestre 6\vision artificial\p6 vision es\STEREO\Left Camera Images\Left Image 4.png');
[filas,columnas]=size(ima1);
ima1(:,columnas/2)=zeros(filas,1);
ima1(filas/2,:)=zeros(1,columnas);
% imshow(ima1)
[u,v,w]=impixel(ima1);
xi=u-columnas/2;
yi=filas/2-v;


ima1=imread('E:\semestre 6\vision artificial\p6 vision es\STEREO\Right Camera Images\Right Image 4.png');
[filas,columnas]=size(ima1);
ima1(:,columnas/2)=zeros(filas,1);
ima1(filas/2,:)=zeros(1,columnas);
% imshow(ima1)
[u,v,w]=impixel(ima1);
xd=u-columnas/2;
yd=filas/2-v;

%[xi yi xd yd]
Z=(f*o./(xi-xd));
vec(1,:)=xd;
vec(2,:)=yd;
vec(3,:)=Z;
end
axis([-240,240,-320,320,0,55])
vec(4,:)=((round((round(vec(3,:))./10)+.5)).*10)-5;
vec(3,:)=(155-vec(3,:));
vec(4,:)=(155-vec(4,:));
plot3(vec(1,:),vec(2,:),vec(3,:))
plot3(vec(1,:),vec(2,:),vec(4,:))