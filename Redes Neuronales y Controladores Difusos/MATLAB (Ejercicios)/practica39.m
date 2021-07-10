clc
clear all
close all

for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
%subplot(3,8,i),imshow(IMA)
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
%FOTOS(:,i)=reshape(GRIS,90000,1);
end

P=FOTOS(:,1:8);
[NE NP]=size(P);
W1=P';
B=NE*ones(NP,1);
Pp=FOTOS(:,10);
a=purelin(W1*Pp+B);

epsilon=.5*((1)/(NP-1));
W2=eye(NP)-epsilon*((ones(NP,NP)-eye(NP)));
for n=1:100
    a=poslin(W2*a);
end

[Y,I]=max(a)