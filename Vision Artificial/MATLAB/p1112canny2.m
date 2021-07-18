clc
clear all
close all

er=0;
%macara de sobel
xx=[-1,0,1;-1,0,1;-1,0,1];
yy=[-1,-1,-1;0,0,0;1,1,1];
mx=[-1,0,1;-2,0,2;-1,0,1];
my=[-1,-2,-1;0,0,0;1,2,1];
filgau=[2,4,5,4,2;4,9,12,9,4;5,12,15,12,5;4,9,12,9,4;2,4,5,4,2]./159;

%paso 1 leer imagen
ima=imread('C:\Users\xmax1946\Desktop\semestre 6\letrasnumeros.jpg');
%%figure,imshow(ima);

%paso 2 escala de grises 
imag=rgb2gray(ima);
%figure,imshow(imag)
imag=double(imag);


%paso 3 suavisado de imagen
[filas,columnas]=size(imag);
imags=zeros(filas,columnas);
%Gfiltro=exp(-(xx.^2.+yy.^2)/(2*.5^2));%filtro 1
%Gfiltro=(exp(-(xx.^2.+yy.^2)/(2*.5^2)))/(2*pi*.5^2);%filtro 2
%Gfiltro=filgau; %filtro 3 sin normalizar
%GfiltroN=Gfiltro/sum(sum(Gfiltro));

%crear filtro gaussiano
w=5;
wl=(w-1)/2;
wll=wl+1;
sig=1.3;
Gfiltro=zeros(w,w);
for i=-wl:wl
    for j=-wl:wl
        Gfiltro(i+wll,j+wll)=exp(-(i^2+j^2)/(2*pi*sig^2));
    end
end
GfiltroN=Gfiltro./(sum(sum(Gfiltro)));

wll=w-1;
for i=1:filas-wll
    for j=1:columnas-wll
        imags(i+wll,j+wll)=sum(sum(imag(i:(i+wll),j:(j+wll)).*GfiltroN));
    end
end
%figure,imshow(uint8(imags))

%paso 4 aplicacion de gradiente (magnitud y fase)
%dh=zeros(filas,columnas);
%dv=zeros(filas,columnas);
imamaga=zeros(filas,columnas);
imafase=zeros(filas,columnas);
for i=1:filas-2
    for j=1:columnas-2
        x=sum(sum((imags(i:(i+2),j:(j+2)).*mx)))/4;    
        y=sum(sum((imags(i:(i+2),j:(j+2)).*my)))/4;
        %dh(i,j)=x;
        %dv(i,j)=y;
        imamaga(i+1,j+1)=sqrt(x^2+y^2);
        imafase(i+1,j+1)=atan(x/y);
        
    end
end
%figure,imshow(uint8(imamag))
%conversion de radianes a grados
imafase=(imafase./pi)*180;

imamag=zeros(filas,columnas);
for i=1:filas
    for j=1:columnas
        if(imamaga(i,j)>35)
            imamag(i,j)=imamaga(i,j);
        end
    end
end
figure,imshow(uint8(imamag))

%paso 5 supresion de no maximos al gradiente 
%correcion de angulos negativos
for i=1:filas
    for j=1:columnas
        if(imafase(i,j)<0)
            imafase(i,j)=imafase(i,j)+180;
        end
    end
end

angulos=[0,45,90,135];
imafasePos=zeros(filas,columnas);
for i=1:filas-2
    for j=1:columnas-2
            [~,pos]=min(abs(angulos-(imafase(i,j))));
            imafasePos(i,j)=pos;
    end
end

imarb=zeros(filas,columnas);
for i=2:filas-1
    for j=2:columnas-1;
        if (imafasePos(i,j)==1)
            if(imamag(i-1,j)>imamag(i,j)||imamag(i+1,j)>imamag(i,j))
            else
                imarb(i,j)=imamag(i,j);
            end
        end
        
        if (imafasePos(i,j)==2)
            if(imamag(i-1,j-1)>imamag(i,j)||imamag(i+1,j+1)>imamag(i,j))
            else
                imarb(i,j)=imamag(i,j);
            end
        end
        
        if (imafasePos(i,j)==3)
            if(imamag(i,j-1)>imamag(i,j)||imamag(i,j+1)>imamag(i,j))
            else
                imarb(i,j)=imamag(i,j);
            end
        end
        
        if (imafasePos(i,j)==4)
            if(imamag(i-1,j+1)>imamag(i,j)||imamag(i+1,j-1)>imamag(i,j))
            else
                imarb(i,j)=imamag(i,j);
            end
        end
        
    end
end

figure,imshow(uint8(imarb))

%paso 6 histeresis de umbral a la supresion no maxima
t1=30;
t2=40;
imamax=zeros(filas,columnas);

for i=1:filas-2
    for j=1:columnas-2
        if (imarb(i,j)>t2)
            imamax(i,j)=imarb(i,j);
        end
    end
end

figure,imshow(uint8(imamax))

for i=2:filas-1
    for j=2:columnas-1;
        if (imamax(i,j)>0)
            
            if (imafasePos(i,j)==1)
                if(imarb(i-1,j)>t1)
                    imamax(i-1,j)=imarb(i-1,j);
                end
                if(imarb(i+1,j)>t1)
                    imamax(i+1,j)=imarb(i+1,j);
                end
            end
        
            if (imafasePos(i,j)==2)
                if (imarb(i-1,j-1)>t1)
                    imamax(i-1,j-1)=imarb(i-1,j-1);
                end
                if (imarb(i+1,j+1)>t1)
                    imamax(i+1,j+1)=imarb(i+1,j+1);
                end
            end
            
            if (imafasePos(i,j)==3)
                if (imarb(i,j+1)>t1)
                    imamax(i,j+1)=imarb(i,j+1);
                end
                if (imarb(i,j-1)>t1)
                    imamax(i,j-1)=imarb(i,j-1);
                end
            end
            
            if (imafasePos(i,j)==4)
                if (imarb(i-1,j+1)>t1)
                    imamax(i-1,j+1)=imarb(i-1,j+1);
                end
                if (imarb(i+1,j-1)>t1)
                    imamax(i+1,j-1)=imarb(i+1,j-1);
                end
            end
        
        end
    end
end

figure,imshow(uint8(imamax))

%paso 7 cerrar contornos
%aplicar umbralizacion binatia
imaumb=zeros(filas,columnas);
for i=1:filas
    for j=1:columnas
        if(imamax(i,j)>t1)
            imaumb(i,j)=1;
        end
    end
end
figure,imshow(uint8(imaumb*255))

%mascara de convolucion para detectar patron
mc=[1,2,4;128,0,8;64,32,16];

%vector con todos los posiles patrones si se cumple algun patron el ciclo continua
for i=2:filas-2
    for j=2:columnas-2
        if (imaumb(i,j)>0)
            p=sum(sum((imaumb((i-1):(i+1),(j-1):(j+1))).*mc));
            k=i;
            l=j;
            while (p==1||p==2||p==4||p==128||p==8||p==64||p==32||p==16||p==131||p==129||p==3||p==130||p==10||p==138)
                
                if (p==1||p==131||p==129||p==3)
                         d1=[k,l+1];d2=[k+1,l+1];d3=[k+1,l];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==2||p==130||p==10||p==138)
                         d1=[k+1,l-1];d2=[k+1,l];d3=[k+1,l+1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==4)
                         d1=[k+1,l];d2=[k+1,l-1];d3=[k,l-1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==128)
                         d1=[k-1,l+1];d2=[k,l+1];d3=[k+1,l+1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==8)
                         d1=[k-1,l-1];d2=[k,l-1];d3=[k+1,l-1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==64)
                         d1=[k-1,l];d2=[k-1,l+1];d3=[k,l+1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==32)
                         d1=[k-1,l-1];d2=[k-1,l];d3=[k-1,l+1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                if (p==16)
                         d1=[k-1,l-1];d2=[k-1,l];d3=[k,l-1];
                         [~,dir]=max([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                end
                
                
                     mag=sum([imamag(d1(1),d1(2)),imamag(d2(1),d2(2)),imamag(d3(1),d3(2))]);
                    if (mag<2)
                        dir=0;
                    end
                    
                switch dir
                    case 1
                        imaumb(d1(1),d1(2))=1;
                        k=d1(1);
                        l=d1(2);
                    case 2
                        imaumb(d2(1),d2(2))=1;
                        k=d2(1);
                        l=d2(2);
                    case 3
                        imaumb(d3(1),d3(2))=1;
                        k=d3(1);
                        l=d3(2);
                    otherwise
                end 
                
                    if (dir==0||k==1||l==1||k==428||l==840||(imaumb(k,l)==0))
                        p=0;
                    else
                        p=sum(sum((imaumb((k-1):(k+1),(l-1):(l+1))).*mc));
                    end
            end
        end  
    end
    disp(i);
end

figure,imshow(uint8(imaumb*255))

%%%%%%%%segmentar numeros
hist=sum(imaumb,2);
L=length(hist);
for i=1:L
    if(hist(i)>5)
        hist(i)=1;
    else
        hist(i)=0;
    end
end
axis([1 900 0 4])

cont=1;
cortean=0;
Vcorte=zeros(1,30);
for i=1:L
    corte=hist(i);
    if(cortean~=corte)
        Vcorte(cont)=i;
        cont=cont+1;
    end
    cortean=corte;
end

mag=zeros(1,length(Vcorte));
i=2;
while(Vcorte(i)>0)
    mag(i-1)=Vcorte(i)-Vcorte(i-1);
    i=i+1;
end
[~,maximo]=max(mag);
imaseg=imaumb(Vcorte(maximo):Vcorte(maximo+1),:);

hist=sum(imaseg);
L=length(hist);
for i=1:length(hist)
    if(hist(i)>0)
        hist(i)=1;
    else
        hist(i)=0;
    end
end

cont=1;
corte=0;
cortean=0;
Vcorte=zeros(1,10);
for i=1:L
    corte=hist(i);
    if(cortean~=corte)
        Vcorte(cont)=i;
        cont=cont+1;
    end
    cortean=corte;
end

num=(length(Vcorte)/2);
imagenes=cell(1,num);
cont=1;
for i=1:num
    ult=i*2;
    pri=ult-1;
    if (Vcorte(ult)-Vcorte(pri))>5
    imagenes{cont}=imaseg(:,Vcorte(pri):Vcorte(ult));
    cont=cont+1;
    end
end

% % for i=1:num
% %    figure,imshow(uint8(imagenes{i}.*255)) 
% % end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Pp=zeros(361,30);
for imnn=1:102
%normalizar imagen
Nplaca=imagenes{imnn};
[fil,col]=size(Nplaca);
NplacaN=zeros(fil,fil);
dis=round((fil-col)/2);
for i=1:fil
for j=dis:(col+dis-1)
   NplacaN(i,j)=Nplaca(i,j-dis+1);
end
end
%%imshow(uint8(NplacaN*255))

%calculo de centroide
[fil,col]=size(NplacaN);
vfil=1:fil;
vcol=1:col;
vhfil=zeros(1,fil);
vhcol=zeros(1,col);
tot=fil*col;
for i=1:fil
    vhfil(i)=sum(NplacaN(i,:));
end
for i=1:col
    vhcol(i)=sum(NplacaN(:,i));
end
Npixel=sum(sum(Nplaca));
vx=round(sum(vhcol.*vcol)/sum(Npixel));
vy=round(sum(vhfil.*vfil)/sum(Npixel));

%determinar posiciones de pixeles 
% punx=zeros(1,5);
% puny=zeros(1,5);
% cx=1;
% cy=1;
% for i=1:360
%     rad=((i-1)/180)*pi;
%     r=1;
%     x=round(r*cos(rad));
%     y=round(r*sin(rad));
%     px=x+vx;
%     py=vy-y;
%     while(px>0&&px<=fil&&py>0&&py<=fil)
%         if(NplacaN(px,py)>0)
%             punx(cx)=px;
%             puny(cy)=py;
%             cx=cx+1;
%             cy=cy+1;
%         end
%         r=r+1;
%         x=round(r*cos(rad));
%         y=round(r*sin(rad));
%         px=x+vx;
%         py=vy-y;
%     end
%        
% end

%determinar signatura con puntos lejanos
punx=0;
puny=0;
mag=zeros(1,360);
com=zeros(fil,fil);
for i=-89:271
    rad=((i-1)/180)*pi;
    r=1;
    x=round(r*cos(rad));
    y=round(r*sin(rad));
    px=x+vx;
    py=vy-y;
    while(px>0&&px<=fil&&py>0&&py<=fil)
        if(NplacaN(px,py)>0)
            punx=px;
            puny=py;
            com(px,py)=1;
        end
        r=r+1;
        x=round(r*cos(rad));
        y=round(r*sin(rad));
        px=x+vx;
        py=vy-y;
    end
    mag(i+90)=sqrt((punx-vx)^2+(puny-vy)^2); 
end

%%figure,imshow(uint8(NplacaN*255))
%%figure,plot(mag)
%%figure,imshow(uint8(com*255))
van=mag(361);
for c=1:30
    %cla
    for i=2:360-1
    v=mag(i);
    if(abs(v-van)>.1)
        mag(i)=((mag(i+1)+mag(i-1))/2); 
    end
    van=v;
    end
    %plot(mag./max(mag))
    %pause(.1)
end
subplot(17,6,imnn)
plot(mag./max(mag))
Pp(:,imnn)=mag./max(mag);
axis([0 361 0 1])
end
%comprobacion 
% 
%  rpatrones=fopen('C:\Users\xmax1946\Desktop\semestre 6\numeros.txt','r');
%  Psr=fscanf(rpatrones,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[361,33]);
%  fclose(rpatrones);
%  Psr=Psr(:,1:10);
% 
%  % [NE,NP]=size(P);
% Verror=100*ones(1,30);
% P=Pp(1:361,:);
% [NE,NP]=size(P);
% for i=1:10
%    ppa=Psr(:,i);
%    for j=1:30
%    Verror(j)=sum(abs(ppa-P(:,j)));
%    end
%    [~,mini]=min(Verror);
%    disp(mini)
%    %Verror=100*ones(1,30);
% end
% % for i=1:NE
% %     for j=1:NP
% %         if(P(i,j)>=.5)
% %             P(i,j)=1;
% %         else
% %             P(i,j)=0;
% %         end
% %     end
% % end
% 
%  %Pp=mag./max(mag);   
% % for i=1:NP
% %     P(:,NP)=P(:,NP)./(norm(P(:,NP)));
% % end
% 
% % for i=1:length(Pp)
% %     if (Pp(i)>=.5)
% %         Pp(i)=1;
% %     else
% %         Pp(i)=0;
% %     end
% % end
% % er=0;
% % %Pp=Pp./(norm(Pp));
% % for pi=1:30
% % [NE,NP]=size(P);
% % Ppa=P(:,pi);
% % W1=P';
% % B=NE*ones(NP,1);
% % a=purelin(W1*Ppa+B);
% % epsilon=.5*((1)/(NP-1));
% % W2=eye(NP)-epsilon*((ones(NP,NP)-eye(NP)));
% % for n=1:10
% %     a=poslin(W2*a);
% % end
% % [~,E]=max(a)
% %     if (E~=pi)
% %         er=er+1;
% %     end
% % end
% % disp(er)
% %  