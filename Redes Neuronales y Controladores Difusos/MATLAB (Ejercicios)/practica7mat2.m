clc
clear all
close all

A=-25:25;
V=-100:100;
D=0:100;

AGm=trapezoidal(A,-25,-25,-15,-10);
AMm=triangular(A,-15,-10,0);
Z=triangular(A,-5,0,5);
AM=triangular(A,0,10,15);
AG=trapezoidal(A,10,15,25,25);

MC=trapezoidal(D,0,0,5,10);
C=triangular(D,0,25,50);
I=triangular(D,25,50,75);
L=triangular(D,50,75,90);
ML=trapezoidal(D,75,90,100,100);

Ami=trapezoidal(V,-100,-100,-75,-50);
Mmi=triangular(V,-75,-50,0);
Ii=triangular(V,-15,0,15);
Mi=triangular(V,0,50,75);
Ai=trapezoidal(V,50,75,100,100);

Amd=Ami;
Mmd=Mmi;
Id=Ii;
Md=Mi;
Ad=Ai;

close all
% 
% figure,hold on
% plot(A,AGm);
% plot(A,AMm);
% plot(A,Z);
% plot(A,AM);
% plot(A,AG);
% hold off
% 
% figure,hold on
% plot(D,MC);
% plot(D,C);
% plot(D,I);
% plot(D,L);
% plot(D,ML);
% hold off
MMd=[1 2 3 4 5;1 2 4 4 5;1 2 4 4 5;1 2 5 4 5;1 2 5 4 5];
MMi=[5 4 3 2 1;5 4 4 2 1;5 4 4 2 1;5 4 5 2 1;5 4 5 2 1];

%xa=0;
%xd=1;

for xa=-24:25
    for xd=1:100

        VuD(1)=0;
        VuA(1)=0;
        VpD(1)=0;
        VpA(1)=0;
        
        
        
for i=1:length(A)
   if A(i)==xa
   MeA=[AGm(i) AMm(i) Z(i) AM(i) AG(i)];
   end
end
for i=1:length(D)
   if D(i)==xd
   MeD=[MC(i) C(i) I(i) L(i) ML(i)];
   end
end

cont1=1;
cont2=1;

for i=1:length(MeD)
   if MeD(i)>0   
       VuD(cont1)=i;
       cont1=cont1+1;
   end
   if MeA(i)>0
       VuA(cont2)=i;
       cont2=cont2+1;
   end
end

cont1=1;
cont2=1;

for i=1:length(MeD)
   if MeD(i)>0   
       VpD(cont1)=MeD(i);
       cont1=cont1+1;
   end
   if MeA(i)>0
       VpA(cont2)=MeA(i);
       cont2=cont2+1;
   end
end

cont=[1:10];
cont(:)=1;
Ax=0;
for i=1:length(VuD)
    for j=1:length(VuA)+1;
        
        if Ax==0
        VFM=VpD(i)*VpA(j);
        FMd=MMd(VuD(i),VuA(j));
        FMi=MMi(VuD(i),VuA(j));
        end
        if Ax==1
           VFM=0;
        end
        if FMd==1||Ax==1
            M1Vd(cont(1))=VFM;
            cont(1)=cont(1)+1;
        end
        if FMd==2||Ax==1
            M2Vd(cont(2))=VFM;
            cont(2)=cont(2)+1;
        end
        if FMd==3||Ax==1
            M3Vd(cont(3))=VFM;
            cont(3)=cont(3)+1;
        end
        if FMd==4||Ax==1
            M4Vd(cont(4))=VFM;
            cont(4)=cont(4)+1;
        end
        if FMd==5||Ax==1
            M5Vd(cont(5))=VFM;
            cont(5)=cont(5)+1;
        end
        if FMi==1||Ax==1
            M1Vi(cont(6))=VFM;
            cont(6)=cont(6)+1;
        end
        if FMi==2||Ax==1
            M2Vi(cont(7))=VFM;
            cont(7)=cont(7)+1;
        end
        if FMi==3||Ax==1
            M3Vi(cont(8))=VFM;
            cont(8)=cont(8)+1;
        end
        if FMi==4||Ax==1
            M4Vi(cont(9))=VFM;
            cont(9)=cont(9)+1;
        end
        if FMi==5||Ax==1
            M5Vi(cont(10))=VFM;
            cont(10)=cont(10)+1;
        end
        if Ax==1
            Ax=0;
        end
        if j==length(VuA)
            Ax=1;
        end
    end
end

FMD=[max(M1Vd) max(M2Vd) max(M3Vd) max(M4Vd) max(M5Vd)];
FMi=[max(M1Vi) max(M2Vi) max(M3Vi) max(M4Vi) max(M5Vi)];
clear M1Vd M2Vd M3Vd M4Vd M5Vd
clear M1Vi M2Vi M3Vi M4Vi M5Vi


for k=1:length(V)
    if Amd(k)>=FMD(1)
        Amdn(k)=FMD(1);
    else
        Amdn(k)=Amd(k);
    end
     if Mmd(k)>=FMD(2)
        Mmdn(k)=FMD(2);
     else
         Mmdn(k)=Mmd(k);
     end
     if Id(k)>=FMD(3)
        Idn(k)=FMD(3);
     else 
         Idn(k)=Id(k);
     end
     if Md(k)>=FMD(4)
        Mdn(k)=FMD(4);
     else
         Mdn(k)=Md(k);
     end
     if Ad(k)>=FMD(5)
        Adn(k)=FMD(5);
     else
         Adn(k)=Ad(k);
     end
   D_MD(k)=max([Amdn(k) Mmdn(k) Idn(k) Mdn(k) Adn(k)]);

     if Ami(k)>=FMi(1)
        Amin(k)=FMi(1);
    else
        Amin(k)=Ami(k);
    end
     if Mmi(k)>=FMi(2)
        Mmin(k)=FMi(2);
     else
         Mmin(k)=Mmi(k);
     end
     if Ii(k)>=FMi(3)
        Iin(k)=FMi(3);
     else 
         Iin(k)=Ii(k);
     end
     if Mi(k)>=FMi(4)
        Min(k)=FMi(4);
     else
         Min(k)=Mi(k);
     end
     if Ai(k)>=FMi(5)
        Ain(k)=FMi(5);
     else
         Ain(k)=Ai(k);
     end
   D_MI(k)=max([Amin(k) Mmin(k) Iin(k) Min(k) Ain(k)]);
end
c_MI=sum(D_MI.*V.*1)/sum(D_MI.*1);
c_MD=sum(D_MD.*V.*1)/sum(D_MD.*1);

 v1=xa+25;
 v2=xd;
 tr_i(v1,v2)=c_MI;
 tr_d(v1,v2)=c_MD;
     end
end
 
[X,Y]=meshgrid(1:100,-24:25);
figure,surf(X,Y,tr_i)
figure,surf(X,Y,tr_d)