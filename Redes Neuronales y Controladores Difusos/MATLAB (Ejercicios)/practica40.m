clc
clear all
close all

for i=1:24;
ruta=strcat('F:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);

%subplot(3,8,i),imshow(IMA)
GRIS=double(rgb2gray(IMA));
album(:,i)=reshape(GRIS,90000,1);
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
%FOTOS(:,i)=reshape(GRIS,90000,1);
end

Pp=imread('F:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\PP2.jpg');
Pp=double(rgb2gray(Pp));
Pp=reshape(Pp,90000,1)./norm(reshape(Pp,90000,1));
P=FOTOS;

[NE NP]=size(P);
W1=P';
B=NE*ones(NP,1);
a=purelin(W1*Pp+B);

epsilon=.5*((1)/(NP-1));
W2=eye(NP)-epsilon*((ones(NP,NP)-eye(NP)));
for n=1:100
    cla
    for i=1:24
        subplot(3,8,i),imshow(uint8(reshape(album(:,i),300,300)))
        title(num2str(a(i,1)))
    end
    drawnow
    a=poslin(W2*a);
end

[Y,I]=max(a)