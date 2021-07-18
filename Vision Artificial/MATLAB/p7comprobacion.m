
for N=1:25
ruta=strcat('C:\Users\xmax1946\Desktop\Modelos\',num2str(N),'.bmp');
ima=imread(ruta);
gris=double(rgb2gray(ima));
[filas,columnas]=size(gris);
f=zeros(filas,columnas);
for i=1:filas
    for j=1:columnas
        if gris(i,j)>=240
            f(i,j)=0;
        else
            f(i,j)=1;
        end
    end
end


M=MomenInv(f)';
M=M./nor';
M=M./norm(M);
Pp=M;
[NE,NP]=size(P);
W1=P';
B=NE*ones(NP,1);
a=purelin(W1*Pp+B);
epsilon=.5*((1)/(NP-1));
W2=eye(NP)-epsilon*((ones(NP,NP)-eye(NP)));
for n=1:10
    a=poslin(W2*a);
end
[V,E]=max(a);

subplot(5,5,N)
imshow(ima)
if E==1||E==6||E==11||E==16||E==21
    title('Bulbasaur')
    disp('Bulbasaur')
end
if E==2||E==7||E==12||E==17||E==22
    title('Charmander')
    disp('Charmander')
end
if E==3||E==8||E==13||E==18||E==23
    title('Squirtle')
    disp('Squirtle')
end
if E==4||E==9||E==14||E==19||E==24
    title('Mew')
    disp('Mew')
end
if E==5||E==10||E==15||E==20||E==25
    title('Mewtwo')
    disp('Mewtwo')
end

end