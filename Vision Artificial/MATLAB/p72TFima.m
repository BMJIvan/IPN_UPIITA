clc
%clear all
close all

ima=imread('E:\semestre 6\vision artificial\bool.bmp');
imshow(ima)
gris=double(rgb2gray(ima));
[filas,columnas]=size(gris);

for i=1:filas
    for j=1:columnas
        gris(i,j)=gris(i,j)*(((-1)^(i+j)));
    end
end
TF=fft2(gris);
mesh(abs(TF))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for r=1:filas;
filtro=zeros(filas,columnas);
for i=1:filas
    for j=1:columnas
        if (((i-filas/2)^2+(j-columnas/2)^2)<r^2)
        filtro(i,j)=0;
        else 
            filtro(i,j)=1;
        end
        
    end
end

%figure,imshow(uint8(filtro))
filtrada=TF.*filtro;
NI=ifft2(filtrada);
imshow(uint8(abs(NI)))
drawnow
%imshow(uint8(gris))
end