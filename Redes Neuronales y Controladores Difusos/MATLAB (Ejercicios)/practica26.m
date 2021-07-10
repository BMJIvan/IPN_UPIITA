clc
clear all
close all

for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
end

for i=1:12;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\PP',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i+24)=reshape(GRIS,90000,1);
end


P=FOTOS(:,1:24);
T=[1:8 1:8 1:8];
[NE,NP]=size(P);
W=rand(1,NE);
B=rand;
epsilon=0.8;

hold on
for EPOCAS=1:5000
    cla
for i=1:NP
    PP=P(:,i);
    a(i)=purelin(W*PP-B);
    e(i)=T(i)-a(i);
    W=W+epsilon*e(i)*PP';
    B=B-epsilon*e(i);
end
% stem(T)
% stem(a,'r')
% pause(.01)

end
hold off