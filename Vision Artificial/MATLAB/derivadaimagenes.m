clc
clear all
close all
ima=imread('F:\semestre 6\vision artificial\p000 imagenes\3.jpg');
f=double(rgb2gray(ima));
%imshow(f)
mesh(f)

[filas,columnas]=size(f);

for i=2:filas-1
    %Gx(i,:)=(f(i+1,:)-f(i-1,:)/2);
    Gx(i,:)=abs((f(i+1,:)-f(i-1,:))/2);
end

for i=2:columnas-1
    %Gx(i,:)=(f(i+1,:)-f(i-1,:)/2);
    Gy(:,i)=abs((f(:,i+1)-f(:,i-1))/2);
end
Gx=Gx(1:filas-1,1:columnas-1);
Gy=Gy(1:filas-1,1:columnas-1);
G=sqrt(Gx.^2+Gy.^2);
%%figure,mesh(f)
%figure,mesh(Gx)
%figure,imshow(uint8(Gx))
%figure,imshow(uint8(Gy))
figure,imshow(uint8(G))

U=30;
for i=1:filas-1
    for j=1:columnas-1
        if(G(i,j)>=U)
            BIN(i,j)=255;
        else
            BIN(i,j)=0;
        end
        
    end
end
imshow(uint8(BIN))