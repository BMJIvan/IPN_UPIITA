clc
clear all
close all

for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
end
% 
% for i=1:12;
% ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\PP',num2str(i),'.jpg');
% IMA=imread(ruta);
% GRIS=double(rgb2gray(IMA));
% FOTOS(:,i+24)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
% end


P=FOTOS(:,1:16);
T=[1:8 1:8];
[NE,NP]=size(P);
Pm=inv(P'*P)*P';
W=T*Pm;
%Pp=[1;1;-1];
%a=purelin(W*Pp)


for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
subplot(6,4,i),imshow(IMA)
GRIS=double(rgb2gray(IMA));
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
%FOTOS(:,i)=reshape(GRIS,30,1);
a=purelin(W*FOTOS(:,i));

a=uint8(a);
if a==0
    a=1;
end
if a==1
    nombre='policia';
end
if a==2
    nombre='Emmet';
end
if a==3
    nombre='bussines';
end
if a==4
    nombre='lucy';
end
if a==5
    nombre='frank';
end
if a==6
    nombre='Benny';
end
if a==7
    nombre='Skeletton';
end
if a==8
    nombre='batman';
end


title(num2str(nombre))
end


% W=rand(1,NE);
% B=rand;
% epsilon=0.8;
% 
% hold on
% for EPOCAS=1:5000
%     cla
% for i=1:NP
%     PP=P(:,i);
%     a(i)=purelin(W*PP-B);
%     e(i)=T(i)-a(i);
%     W=W+epsilon*e(i)*PP';
%     B=B-epsilon*e(i);
% end
% % stem(T)
% % stem(a,'r')
% % pause(.01)
% 
% end
% hold off