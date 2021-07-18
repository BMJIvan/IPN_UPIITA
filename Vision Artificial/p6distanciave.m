clc
clear all
close all

vid = videoinput('winvideo', 2, 'YUY2_640x480');
src = getselectedsource(vid);

preview(vid);

start(vid);

pause(10)

for i=1:2
    disp(i)
    J=getsnapshot(vid);
    pause(5); 
    % es el tiempo de espera entre una foto y otra
    K{i}=rgb2gray(J); % convierte la imagen a escala de grises
    %umbral=graythresh(K);
    %umbral=0.45; 
    %bw=im2bw(K,umbral);  
   
    
end

stoppreview(vid);

stop(vid);

delete(vid)

o=10;
f=2300;
ima2=K{1};
ima1=K{2};

[filas,columnas]=size(ima1);
ima1(:,columnas/2)=zeros(filas,1);
ima1(filas/2,:)=zeros(1,columnas);
% imshow(ima1)
[u,v,w]=impixel(ima1);
xi=u-columnas/2;
yi=filas/2-v;

[filas,columnas]=size(ima2);
ima2(:,columnas/2)=zeros(filas,1);
ima2(filas/2,:)=zeros(1,columnas);
% imshow(ima1)
[u,v,w]=impixel(ima2);
xd=u-columnas/2;
yd=filas/2-v;

z=60;
c=[xi yi xd yd];
disp(c)
Z=(f*o)/(xi-xd);
disp(Z)
%f=(z*(xi-xd))/o;
%disp(f)
