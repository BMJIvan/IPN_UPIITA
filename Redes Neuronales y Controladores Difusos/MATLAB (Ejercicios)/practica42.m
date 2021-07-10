clc
clear all
close all

for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
end
p=FOTOS(:,1:8);
[NE NP]=size(p);

for i=1:NP
   p(:,i)=p(:,i)./norm(p(:,i)); 
end

for i=9:24
    i=15;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
subplot(4,4,i-8),imshow(IMA);

pp=FOTOS(:,i);
pp=pp./norm(pp);
a=compet(p'*pp);
[Y,I]=max(a);

if I==1
    g=('policia malo');
end
if I==2
    g=('emmet');
end
if I==3
    g=('bussiness');
end
if I==4
    g=('lucy');
end
if I==5
    g=('constructor');
end
if I==6
    g=('h. espacial');
end
if I==7
    g=('robot');
end
if I==8
    g=('batman');
end
title(num2str(g))
end