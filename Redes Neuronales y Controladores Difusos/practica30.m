clc
clear all
close all

for i=1:15;
ruta=strcat('F:\semestre 5\sistemas neurodifusos\patrones letras\P',num2str(i),'.bmp');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,30,1)./norm(reshape(GRIS,30,1));
%FOTOS(:,i)=reshape(GRIS,30,1);
end

for i=17:31;
ruta=strcat('F:\semestre 5\sistemas neurodifusos\patrones letras\P',num2str(i),'.bmp');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i-1)=reshape(GRIS,30,1)./norm(reshape(GRIS,30,1));
%FOTOS(:,i)=reshape(GRIS,30,1);
end


P=FOTOS(:,1:30);
T=[1:5 1:5 1:5 1:5 1:5 1:5];
[NE,NP]=size(P);
W=rand(1,NE);
B=rand;
epsilon=.5;

hold on
for EPOCAS=1:500
    cla
for i=1:NP
    PP=P(:,i);
    a(i)=purelin(W*PP-B);
    e(i)=T(i)-a(i);
    %sum(abs(e))
    W=W+epsilon*e(i)*PP';
    B=B-epsilon*e(i);
end
% stem(T)
% stem(a,'r')
% pause(.01)

end
hold off