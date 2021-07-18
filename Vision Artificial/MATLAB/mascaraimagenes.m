clc
clear all
close all
ima=imread('E:\semestre 6\vision artificial\p000 imagenes\2.jpg');
gris=rgb2gray(ima);
sx=[-1,-2,-1;0,0,0;1,2,1];
sy=[-1,0,1;-2,0,2;-1,0,1];
ssx=[-1,-1,-1;0,0,0;1,1,1];
ssy=[-1,0,1;-1,0,1;-1,0,1];

[filas,columnas]=size(gris);

for i=1:filas-2
    for j=1:columnas-2
   mat=double(gris(i:i+2,j:j+2));     
   nmat1(i,j)=uint8(abs(sum(sum(mat.*sx,2))));     
   nmat2(i,j)=uint8(abs(sum(sum(mat.*sy,2))));
   nmat3(i,j)=uint8(sqrt(((sum(sum(mat.*sx,2))^2))+((sum(sum(mat.*sy,2)))^2)));
   nmat4(i,j)=uint8(abs(sum(sum(mat.*ssx,2))));     
   nmat5(i,j)=uint8(abs(sum(sum(mat.*ssy,2))));
   nmat6(i,j)=uint8(sqrt(((sum(sum(mat.*ssx,2))^2))+((sum(sum(mat.*ssy,2)))^2)));
    end
end
figure,imshow(nmat1)
figure,imshow(nmat2)
figure,imshow(nmat3)
figure,imshow(nmat4)
figure,imshow(nmat5)
figure,imshow(nmat6)
