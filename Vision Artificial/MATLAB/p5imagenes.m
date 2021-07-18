clc
clear all
close all
A=imread('E:\semestre 6\vision artificial\bool.bmp');
GRIS=double(rgb2gray(A));
imshow(uint8(GRIS))
[filas,columnas]=size(GRIS);

salida=zeros(filas,columnas);
dx=50;
dy=250;
th=5;
sx=2;
sy=2;
for i=1:filas
    for j=1:columnas
        
       % salida(i,j)=255-GRIS(i,j); 
       % T=[1,0,dx;0,1,dy;0,0,1]*[i;j;1]; traslacion
       % T=[cosd(th),-sind(th),0;sind(th),cosd(th),1;0,0,1]*[i;j;1]; rotaacion
       T=[sx,0,0;0,sy,0;0,0,1]*[i;j;1];
       %salida(uint16(T(1,1))+1,uint16(T(2,1))+1)=GRIS(i,j); rotacion
       salida(uint16(T(1,1)),uint16(T(2,1)))=GRIS(i,j);
    end
end
figure,imshow(uint8(salida))