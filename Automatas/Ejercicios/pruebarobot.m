disp('creacion robot')
Ar(1)=Link([0 3 0 pi/2 0 0]);
Ar(2)=Link([0 0 0 pi/2 0 pi/2]);
Ar(3)=Link([0 3  -1 0 0 0]);
Ar(4)=Link([0 0 0 -pi/2 0 0]);
Ar(5)=Link([0 0 0 pi/2 0 -pi/2]);
Ar(6)=Link([0 1 0 0 0 0]);
qli=[-pi pi;-pi pi;-pi pi; -pi pi;-pi pi;-pi pi];
antropom=SerialLink(Ar,'name','antrop','qlim',qli);  
antropom.plotopt = {'workspace', [-8 8 -8 8 -3 11]}; 
disp('inicio de animacion')
antropom.teach([0,0,pi/2,0,0,0])

dx=.5;
dy=.5;
dz=6.536;
ll1=3;
th2=real(vpa((asin((dz-ll1)/(sqrt(dx^2+dy^2+(dz-ll1)^2)))-atan(2/3))));
th2=round(th2*1000)/1000;
th1=real(vpa(atan2(dy,dx)));
th1=round(th1*1000)/1000;

% th2=real(vpa((asin((dz-ll1)/(sqrt(dx^2+dy^2+(dz-ll1)^2)))-atan(2/3))*180/pi));
% th1=real(vpa(atan2(dy,dx)));
