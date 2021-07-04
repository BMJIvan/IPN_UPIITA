clc 
close all

syms q1 q2 q3 q4 q5 q6 l1 l2a l2b l3 l4

M=[q1     ,l1 ,0   ,pi/2
   q2+pi/2,0  ,0   ,pi/2
   q3     ,l2a,l2b,0    
   q4     ,l3 ,0   ,-pi/2
   q5-pi/2,0  ,0   ,pi/2
   q6     ,l4 ,0   ,0];
    
T01=rrz(M(1,1))*rtz(M(1,2))*rtx(M(1,3))*rrx(M(1,4));
T12=rrz(M(2,1))*rtz(M(2,2))*rtx(M(2,3))*rrx(M(2,4));
T23=rrz(M(3,1))*rtz(M(3,2))*rtx(M(3,3))*rrx(M(3,4));
T34=rrz(M(4,1))*rtz(M(4,2))*rtx(M(4,3))*rrx(M(4,4));
T45=rrz(M(5,1))*rtz(M(5,2))*rtx(M(5,3))*rrx(M(5,4));
T56=rrz(M(6,1))*rtz(M(6,2))*rtx(M(6,3))*rrx(M(6,4));

T02=T01*T12;
T03=T02*T23;
T04=T03*T34;
T05=T04*T45;
T06=T05*T56;
disp('cinematica directa')
Tp0=subs(T01,{q1,q2,q3,q4,q5,q6,l1,l2a,l2b,l3,l4},{0,0,pi,0,0,0,3,3,-1,0,1});
Tp1=subs(T02,{q1,q2,q3,q4,q5,q6,l1,l2a,l2b,l3,l4},{0,0,pi,0,0,0,3,3,-1,0,1});
Tp2=subs(T03,{q1,q2,q3,q4,q5,q6,l1,l2a,l2b,l3,l4},{0,0,pi,0,0,0,3,3,-1,0,1});
Tp3=subs(T04,{q1,q2,q3,q4,q5,q6,l1,l2a,l2b,l3,l4},{0,0,pi,0,0,0,3,3,-1,0,1});
Tp4=subs(T05,{q1,q2,q3,q4,q5,q6,l1,l2a,l2b,l3,l4},{0,0,pi,0,0,0,3,3,-1,0,1});
Tp5=subs(T06,{q1,q2,q3,q4,q5,q6,l1,l2a,l2b,l3,l4},{0,0,pi,0,0,0,3,3,-1,0,1});
disp('sustituir en cinematica directa')
T06s=subs(T06,{l1,l2a,l2b,l3,l4},{3,3,-1,0,1});

dt=.01;

Mp{1}=[-1,0,0,-4
       0,0,-1,1
       0,-1,0,2
       0,0,0,1];
Mp{2}=[0,-1,0,-2.82
       1,0,0,1
       0,0,1,4.82
       0,0,0,1];
Mp{3}=[1,0,0,0
       0,0,-1,1
       0,1,0,6
       0,0,0,1];
Mp{4}=[1,0,0,2.82
       0,1,0,1
       0,0,1,4.82
       0,0,0,1];
Mp{5}=[1,0,0,4
       0,0,1,1
       0,-1,0,2
       0,0,0,1];
   
LLm=length(Mp)-1;
LLd=length(0:dt:1);
num=LLm*LLd;
MMv=cell(1,num);
tipo=[0,3,5,3];
disp('interpolacion')
disp(num)
disp('datos')
for i=1:LLm
MMv(1,1+((i-1)*LLd):LLd+((i-1)*(LLd)))=M2M(Mp{i},Mp{i+1},tipo(i),dt);
end

L=length(MMv);
Ma=zeros(L,6);
disp('cinematica inversa')
for i=1:length(MMv)
M=MMv{i};
dx=M(1,4);
dy=M(2,4);
dz=M(3,4);
R06c=M(1:3,1:3);
  
dx=dx-R06c(1,3);
dy=dy-R06c(2,3);
dz=dz-R06c(3,3);

Tp=subs(T03,{l1,l2a,l2b,l3,l4,q3},{3,3,-1,0,1,pi});

ll1=3;
th2=real(vpa((asin((dz-ll1)/(sqrt(dx^2+dy^2+(dz-ll1)^2)))-atan(1/3))));
th2=round(th2*1000)/1000;
th1=real(vpa(atan2(dy,dx)));
th1=round(th1*1000)/1000;

T03c=subs(Tp,{q1,q2},{th1,th2});

R03c=round(vpa(T03c(1:3,1:3))*1000)/1000;
R36c=round((R03c\R06c)*1000)/1000;
if(i==1)
T36s=T34*T45*T56;
R36s=expand(T36s(1:3,1:3));
end
th5=real(round(vpa(asin(R36c(3,3)))*1000)/1000);
if (th5>=pi/2||th5<=-pi/2)
   disp('o se puede pasar por ese punto, ses va modificar el valor')
   th5=th5-.1;
end
th6=real(round(atan2(-R36c(3,2),R36c(3,1))*1000)/1000);
th4=real((round(vpa(asin(R36c(2,3)/(-cos(th5))))*1000)/1000));

Ma(i,:)=vpa([th1,th2,pi,th4,th5,th6]);
disp(i)
end

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
antropom.teach(Ma)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Jacobiano')
z0=[0;0;1];
z1=T01(1:3,3);
z2=T02(1:3,3);
z3=T03(1:3,3);
z4=T04(1:3,3);
z5=T05(1:3,3);

d01=T01(1:3,4);
d02=T02(1:3,4);
d03=T03(1:3,4);
d04=T04(1:3,4);
d05=T05(1:3,4);
d06=T06(1:3,4);

J11=expand(cross(z0,d06));
J12=expand(cross(z1,d06-d01));
J13=expand(cross(z2,d06-d02));
J14=expand(cross(z3,d06-d03));
J15=expand(cross(z4,d06-d04));
J16=expand(cross(z5,d06-d05));

J=expand([J11,J12,J13,J14,J15,J16;z0,z1,z2,z3,z4,z5]);
disp(J)
disp('singularidades')
Jm11=J(1:3,1:3);
Jm22=J(4:6,4:6);
Jm12=J(1:3,4:6);
Jm21=J(4:6,1:3);
si=det(Jm11)-det(Jm22);
si=simplify(si);
disp(si);
disp('-pi/2<q5=<pi/2')
disp('medida de la jacobiana')
Mj=abs(si);
disp(Mj)
