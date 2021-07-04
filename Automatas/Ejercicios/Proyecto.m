clear all
close all
clc
L(1)=Link([0 2 0 pi/2 0 0]);
L(2)=Link([0 0 0 pi/2 0 pi/2]);
L(3)=Link([0 3  -1 0 0 0]);
L(4)=Link([0 0 0 -pi/2 0 0]);
L(5)=Link([0 0 0 pi/2 0 -pi/2]);
L(6)=Link([0 1 0 0 0 0]);
qli=[-pi pi;-pi pi;-pi pi; -pi pi;-pi pi;-pi pi];
qz=[.432 -.73 pi/2 1.549 -.73 -.432];%matriz con vectores articulares rengl?n
qfinal=[0 pi/2 pi/2 pi/2 pi/2 pi/2];
antropom=SerialLink(L,'name','antrop','qlim',qli); %construcci?n del objeto polar, 
antropom.plotopt = {'workspace', [-6 6 -6 6 -2 7]}; %opcion del m?todo plot,

% 
% for i=1:200
% qn=[i/100 -i/40 i/20 -i/200 i/50 i/20];
% qz=[qz;qn];
% end

antropom.teach(qz)
% T=antropom.fkine(qz);