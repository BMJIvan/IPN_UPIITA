clc
close all
clear all

% IMA=imread('F:\semestre 5\sistemas neurodifusos\RN.jpg');
 %recorte=imcrop(IMA);
 %imshow(recorte)
 
% pr=imresize(recorte,[300 300]);
 %imshow(pr)
% rojo=IMA(:,:,1);
% verde=IMA(:,:,2);
% azul=IMA(:,:,3);
% 
% subplot(1,3,1)
% imshow(rojo)
% subplot(1,3,2)
% imshow(verde)
% subplot(1,3,3)
% imshow(azul)
cont=1;
N=10;
NF=70;
anc=80;
an=anc^2;
for i=1:NF;
    
ruta=strcat('E:\semestre 5\sistemas neurodifusos\colores\P',num2str(i),'.jpg');
IMA=imread(ruta);
IMA=imresize(IMA,[anc anc]);
rojo=double(IMA(:,:,1));
verde=double(IMA(:,:,2));
azul=double(IMA(:,:,3));
%GRIS=double(rgb2gray(IMA));
%GRIS=imresize(GRIS,[300 300]);
% FOTOSr(:,i)=reshape(rojo,250000,1)./norm(reshape(rojo,250000,1));
% FOTOSv(:,i)=reshape(verde,250000,1)./norm(reshape(verde,250000,1));
% FOTOSa(:,i)=reshape(azul,250000,1)./norm(reshape(azul,250000,1));
FOTOSr(:,i)=reshape(rojo,an,1)./norm(reshape(rojo,an,1));
FOTOSv(:,i)=reshape(verde,an,1)./norm(reshape(rojo,an,1));
FOTOSa(:,i)=reshape(azul,an,1)./norm(reshape(rojo,an,1));
end


Pr=FOTOSr(:,1:NF);
Pv=FOTOSv(:,1:NF);
Pa=FOTOSa(:,1:NF);
Tr=[zeros(1,N) 3*ones(1,N) zeros(1,N) 3*ones(1,N) 3*ones(1,N) zeros(1,N) 3*ones(1,N)];
Tv=[3*ones(1,N) 2*ones(1,N) 1*ones(1,N) zeros(1,N) 1*ones(1,N) zeros(1,N) 3*ones(1,N)];
Ta=[1*ones(1,N) zeros(1,N) 3*ones(1,N) zeros(1,N) zeros(1,N) zeros(1,N) 3*ones(1,N)];

% % Tr=[0,0,3,3,0,0,3,3,3,3,0,0];
% % Tv=[3,3,2,2,1,1,0,0,1,1,0,0];
% % Ta=[1,1,0,0,3,3,0,0,0,0,0,0];
% % 
% % Pmr=inv(Pr'*Pr)*Pr';
% % Wr=Tr*Pmr;
% % 
% % Pmv=inv(Pv'*Pv)*Pv';
% % Wv=Tv*Pmv;
% % 
% % Pma=inv(Pa'*Pa)*Pa';
% % Wa=Ta*Pma;
% % 







Pr=FOTOSr(:,1:NF);
[NE NP]=size(Pr);
Wr=rand(1,NE);
Br=rand;
epsilon=0.4;
for EPOCAS=1:12000
for i=1:NP
    PP=Pr(:,i);
    a(i)=purelin(Wr*PP-Br);
    e(i)=Tr(i)-a(i);
    Wr=Wr+epsilon*e(i)*PP';
    Br=Br-epsilon*e(i);
end
end
max(e)
min(e)

Pv=FOTOSv(:,1:NF);
[NE NP]=size(Pv);
Wv=rand(1,NE);
Bv=rand;
epsilon=0.22;
for EPOCAS=1:12000
for i=1:NP
    PP=Pv(:,i);
    a(i)=purelin(Wv*PP-Bv);
    e(i)=Tv(i)-a(i);
    Wv=Wv+epsilon*e(i)*PP';
    Bv=Bv-epsilon*e(i);
end
end
max(e)
min(e)

Pa=FOTOSa(:,1:NF);
[NE NP]=size(Pa);
Wa=rand(1,NE);
Ba=rand;
epsilon=0.05;
for EPOCAS=1:12000
for i=1:NP
    PP=Pa(:,i);
    a(i)=purelin(Wa*PP-Ba);
    e(i)=Ta(i)-a(i);
    Wa=Wa+epsilon*e(i)*PP';
    Ba=Ba-epsilon*e(i);
end
end
max(e)
min(e)