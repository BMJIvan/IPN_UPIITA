clc
clear all


FIS=readfis('E:\semestre 5\sistemas neurodifusos\matlab\practica7trans.fis');

for i=-24:25
for j=1:100
val=evalfis([i j],FIS);
v1=i+25;
v2=j;
trani(v1,v2)=val(1);
trand(v1,v2)=val(2);

end
end


[X,Y]=meshgrid(1:100,-24:25);
figure,surf(X,Y,trani)
figure,surf(X,Y,trand)