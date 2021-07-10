clc
alto=55;
ancho=150;
P=[ancho
alto];
a=purelin(W*P(:,1)-B);
a=uint8(a);
if a==1
    disp('Silla')
end
if a==2
    disp('Mesa')
end
if a==3
    disp('Cama')
end
