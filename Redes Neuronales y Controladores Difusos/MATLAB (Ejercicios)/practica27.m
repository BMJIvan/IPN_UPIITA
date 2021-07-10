

for i=1:24;
ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\P',num2str(i),'.jpg');
IMA=imread(ruta);
subplot(6,4,i),
GRIS=(rgb2gray(IMA));
imshow(GRIS)
GRIS=double(GRIS);
FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
a=purelin(W*FOTOS(:,i)-B);
a=round(a);
title(num2str(a))
end

% for i=1:12;
% ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\PP',num2str(i),'.jpg');
% IMA=imread(ruta);
% subplot(3,4,i),imshow(IMA)
% GRIS=double(rgb2gray(IMA));
% FOTOS(:,i)=reshape(GRIS,90000,1)./norm(reshape(GRIS,90000,1));
% a=purelin(W*FOTOS(:,i)-B);
% title(num2str(uint8(a)))
% end

% for i=1:12;
% ruta=strcat('E:\semestre 5\sistemas neurodifusos\PATRONES LEGO ROSTROS\PP',num2str(i),'.jpg');
% IMA=imread(ruta);
% GRIS=double(rgb2gray(IMA));
% FOTOS(:,i+24)=reshape(GRIS,90000,1);
% end