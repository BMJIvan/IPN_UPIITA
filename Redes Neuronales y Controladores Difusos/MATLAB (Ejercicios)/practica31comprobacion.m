

for i=1:31;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\patrones letras\P',num2str(i),'.bmp');
IMA=imread(ruta);
subplot(7,5,i),imshow(IMA)
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,30,1)./norm(reshape(GRIS,30,1));
%FOTOS(:,i)=reshape(GRIS,30,1);
a=purelin(W*FOTOS(:,i)-B);

a=uint8(a);
if a==1
    nombre='A';
end
if a==2
    nombre='E';
end
if a==3
    nombre='I';
end
if a==4
    nombre='O';
end
if a==5
    nombre='U';
end

title(num2str(nombre))
end
