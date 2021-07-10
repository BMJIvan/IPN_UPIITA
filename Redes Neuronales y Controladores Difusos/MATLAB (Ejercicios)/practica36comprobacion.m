%for i=1:70
while(1)
    nombre='';
IMA=imread('G:\semestre 5\sistemas neurodifusos\RN.jpg');
recorte=imcrop(IMA);
%ruta=strcat('G:\semestre 5\sistemas neurodifusos\colores\P',num2str(i),'.jpg');
%recorte=imread(ruta);
IMA=imresize(recorte,[anc anc]);
%subplot(10,7,i),imshow(IMA)
rojo=double(IMA(:,:,1));
verde=double(IMA(:,:,2));
azul=double(IMA(:,:,3));
pr=reshape(rojo,an,1);
pv=reshape(verde,an,1);
pa=reshape(azul,an,1);

ar=purelin(Wr*pr);
ar=uint8(ar);

av=purelin(Wv*pv);
av=uint8(av);

aa=purelin(Wa*pa);
aa=uint8(aa);


if ar==0&&av==3&&aa==1
    nombre='verde';
end
if ar==0&&av==1&&aa==3
    nombre='azul';
end
if ar==3&&av==0&&aa==0
    nombre='rojo';
end
if ar==0&&av==0&&aa==0
    nombre='negro';
end
if ar==3&&av==2&&aa==0
    nombre='amarillo';
end

if ar==3&&av==1&&aa==0
    nombre='naranja';
end
if ar==3&&av==3&&aa==3
    nombre='blanco';
end



 title(num2str(nombre))

pause(1)
close all
end