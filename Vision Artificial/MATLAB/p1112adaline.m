Pp11=Pp;
alp=.001;
er=0;
capa1=30000;
capa2=40000;
capa3=50000;
capa4=40000;
capa5=8000;
%gr1 AB123456789-
%gr2 CDEFGHJKLMNPRSTUVWXYZ0
[NE11,NP11]=size(Pp11);
T11=[ones(1,6) 2*ones(1,66) 1*ones(1,30)];
W11=rand(1,NE11);
B11=rand(1);

for epocas=1:capa1
    for i=1:NP11
    a=W11*Pp11(:,i)+B11;
    e=T11(i)-a;
    W11=W11+2*alp*e*Pp11(:,i)';
    B11=B11+2*alp*e;
    end
end

%gr1 DPRSTUVWXYZ0
%gr2 CEFGHJKLMN
T21=[2*ones(1,3) ones(1,3) 2*ones(1,27) ones(1,33)];
Pp21(:,1:66)=Pp11(:,7:72);
[NE21,NP21]=size(Pp21);
W21=rand(1,NE21);
B21=rand(1);

for epocas=1:capa2
    for i=1:NP21
    a=W21*Pp21(:,i)+B21;
    e=T21(i)-a;
    W21=W21+2*alp*e*Pp21(:,i)';
    B21=B21+2*alp*e;  
    end
end

%gr1 456789-
%gr2 AB123
T22=[2*ones(1,15) ones(1,21)];
Pp22(:,1:6)=Pp11(:,1:6);
Pp22(:,7:36)=Pp11(:,73:102);
[NE22,NP22]=size(Pp22);
W22=rand(1,NE22);
B22=rand(1);

for epocas=1:capa2
    for i=1:NP22
    a=W22*Pp22(:,i)+B22;
    e=T22(i)-a;
    W22=W22+2*alp*e*Pp22(:,i)';
    B22=B22+2*alp*e; 
    end
end

%gr1 JKLMN
%gr2 CEFGH
T31=[2*ones(1,15) ones(1,15)];
Pp31(:,1:3)=Pp21(:,1:3);
Pp31(:,4:30)=Pp21(:,7:33);
[NE31,NP31]=size(Pp31);
W31=rand(1,NE31);
B31=rand(1);

for epocas=1:capa3
    for i=1:NP31
    a=round(W31*Pp31(:,i)+B31);
    e=T22(i)-a;
    W31=W31+2*alp*e*Pp31(:,i)';
    B31=B31+2*alp*e; 
    end
end

%gr1 VWXYZ0
%gr2 DPRSTU
T32=[2*ones(1,18) ones(1,18)];
Pp32(:,1:3)=Pp21(:,4:6);
Pp32(:,4:36)=Pp21(:,34:66);
[NE32,NP32]=size(Pp32);
W32=rand(1,NE32);
B32=rand(1);

for epocas=1:capa3
    for i=1:NP31
    a=W32*Pp32(:,i)+B32;
    e=T22(i)-a;
    W32=W32+2*alp*e*Pp32(:,i)';
    B32=B32+2*alp*e; 
    end
end

%gr1 123
%gr2 AB
T33=[2*ones(1,6) ones(1,9)];
Pp33(:,1:15)=Pp22(:,1:15);
[NE33,NP33]=size(Pp33);
W33=rand(1,NE33);
B33=rand(1);

for epocas=1:capa3
    for i=1:NP33
    a=W33*Pp33(:,i)+B33;
    e=T33(i)-a;
    W33=W33+2*alp*e*Pp33(:,i)';
    B33=B33+2*alp*e; 
    end
end

%gr1 89-
%gr2 4567
T34=[2*ones(1,12) ones(1,9)];
Pp34(:,1:21)=Pp22(:,16:36);
[NE34,NP34]=size(Pp34);
W34=rand(1,NE34);
B34=rand(1);

for epocas=1:capa3
    for i=1:NP34
    a=W34*Pp34(:,i)+B34;
    e=T34(i)-a;
    W34=W34+2*alp*e*Pp34(:,i)';
    B34=B34+2*alp*e; 
    end
end

%gr1 FGH
%gr2 CE
T41=[2*ones(1,6) ones(1,9)];
Pp41(:,1:15)=Pp31(:,1:15);%gr2 CEFGH
[NE41,NP41]=size(Pp41);
W41=rand(1,NE41);
B41=rand(1);

for epocas=1:capa4
    for i=1:NP41
    a=W41*Pp41(:,i)+B41;
    e=T41(i)-a;
    W41=W41+2*alp*e*Pp41(:,i)';
    B41=B41+2*alp*e; 
    end
end

%gr1 LMN
%gr2 JK
T42=[2*ones(1,6) ones(1,9)];
Pp42(:,1:15)=Pp31(:,16:30);%gr1 JKLMN
[NE42,NP42]=size(Pp42);
W42=rand(1,NE42);
B42=rand(1);

for epocas=1:capa4
    for i=1:NP42
    a=round(W42*Pp42(:,i)+B42);
    e=T42(i)-a;
    W42=W42+2*alp*e*Pp42(:,i)';
    B42=B42+2*alp*e; 
    end
end

%gr1 STU
%gr2 DPR
T43=[2*ones(1,9) ones(1,9)];
Pp43(:,1:18)=Pp32(:,1:18);%gr2 DPRSTU
[NE43,NP43]=size(Pp43);
W43=rand(1,NE43);
B43=rand(1);

for epocas=1:capa4
    for i=1:NP43
    a=W43*Pp43(:,i)+B43;
    e=T43(i)-a;
    W43=W43+2*alp*e*Pp43(:,i)';
    B43=B43+2*alp*e; 
    end
end

%gr1 YZ0
%gr2 VWX
T44=[2*ones(1,9) ones(1,9)];
Pp44(:,1:18)=Pp32(:,19:36);%gr1 VWXYZ0
[NE44,NP44]=size(Pp44);
W44=rand(1,NE44);
B44=rand(1);

for epocas=1:capa4
    for i=1:NP44
    a=W44*Pp44(:,i)+B44;
    e=T44(i)-a;
    W44=W44+2*alp*e*Pp44(:,i)';
    B44=B44+2*alp*e; 
    end
end

%gr1 B
%gr2 A
T45=[2*ones(1,3) ones(1,3)];
Pp45(:,1:6)=Pp33(:,1:6);%gr2 AB
[NE45,NP45]=size(Pp45);
W45=rand(1,NE45);
B45=rand(1);

for epocas=1:capa4
    for i=1:NP45
    a=W45*Pp45(:,i)+B45;
    e=T45(i)-a;
    W45=W45+2*alp*e*Pp45(:,i)';
    B45=B45+2*alp*e; 
    end
end

%gr1 3
%gr2 12
T46=[2*ones(1,6) ones(1,3)];
Pp46(:,1:9)=Pp33(:,7:15);%gr1 123
[NE46,NP46]=size(Pp46);
W46=rand(1,NE46);
B46=rand(1);

for epocas=1:capa4
    for i=1:NP46
    a=W46*Pp46(:,i)+B46;
    e=T46(i)-a;
    W46=W46+2*alp*e*Pp46(:,i)';
    B46=B46+2*alp*e; 
    end
end

%gr1 67
%gr2 45
T47=[2*ones(1,6) ones(1,6)];
Pp47(:,1:12)=Pp34(:,1:12);%gr2 4567
[NE47,NP47]=size(Pp47);
W47=rand(1,NE47);
B47=rand(1);

for epocas=1:capa4
    for i=1:NP47
    a=W47*Pp47(:,i)+B47;
    e=T47(i)-a;
    W47=W47+2*alp*e*Pp47(:,i)';
    B47=B47+2*alp*e; 
    end
end

%gr1 -
%gr2 89
T48=[2*ones(1,6) ones(1,3)];
Pp48(:,1:9)=Pp34(:,13:21);%gr1 89-
[NE48,NP48]=size(Pp48);
W48=rand(1,NE48);
B48=rand(1);

for epocas=1:capa4
    for i=1:NP48
    a=W48*Pp48(:,i)+B48;
    e=T48(i)-a;
    W48=W48+2*alp*e*Pp48(:,i)';
    B48=B48+2*alp*e; 
    end
end

%gr1 E
%gr2 C
T51=[2*ones(1,3) ones(1,3)];
Pp51(:,1:6)=Pp41(:,1:6);%gr2 CE
[NE51,NP51]=size(Pp51);
W51=rand(1,NE51);
B51=rand(1);

for epocas=1:capa5
    for i=1:NP51
    a=W51*Pp51(:,i)+B51;
    e=T51(i)-a;
    W51=W51+2*alp*e*Pp51(:,i)';
    B51=B51+2*alp*e; 
    end
end


%gr1 H
%gr2 G
%gr3 F
T52=[3*ones(1,3) 2*ones(1,3) ones(1,3)];
Pp52(:,1:9)=Pp41(:,7:15);%gr1 FGH
[NE52,NP52]=size(Pp52);
W52=rand(1,NE52);
B52=rand(1);

for epocas=1:capa5
    for i=1:NP52
    a=W52*Pp52(:,i)+B52;
    e=T52(i)-a;
    W52=W52+2*alp*e*Pp52(:,i)';
    B52=B52+2*alp*e; 
    end
end


%gr1 K
%gr2 J
T53=[2*ones(1,3) ones(1,3)];
Pp53(:,1:6)=Pp42(:,1:6);%gr2 JK
[NE53,NP53]=size(Pp53);
W53=rand(1,NE53);
B53=rand(1);

for epocas=1:capa5
    for i=1:NP53
    a=W53*Pp53(:,i)+B53;
    e=T53(i)-a;
    W53=W53+2*alp*e*Pp53(:,i)';
    B53=B53+2*alp*e; 
    end
end

%gr1 N
%gr2 M
%gr3 L
T54=[3*ones(1,3) 2*ones(1,3) ones(1,3)];
Pp54(:,1:9)=Pp42(:,7:15);%gr1 LMN
[NE54,NP54]=size(Pp54);
W54=rand(1,NE54);
B54=rand(1);

for epocas=1:capa5
    for i=1:NP54
    a=W54*Pp54(:,i)+B54;
    e=T54(i)-a;
    W54=W54+2*alp*e*Pp54(:,i)';
    B54=B54+2*alp*e; 
    end
end

%gr1 R
%gr2 P
%gr3 D
T55=[3*ones(1,3) 2*ones(1,3) ones(1,3)];
Pp55(:,1:9)=Pp43(:,1:9);%gr2 DPR
[NE55,NP55]=size(Pp55);
W55=rand(1,NE55);
B55=rand(1);

for epocas=1:capa5
    for i=1:NP55
    a=W55*Pp55(:,i)+B55;
    e=T55(i)-a;
    W55=W55+2*alp*e*Pp55(:,i)';
    B55=B55+2*alp*e; 
    end
end

%gr1 U
%gr2 T
%gr1 S
T56=[3*ones(1,3) 2*ones(1,3) ones(1,3)];
Pp56(:,1:9)=Pp43(:,10:18);%gr1 STU
[NE56,NP56]=size(Pp56);
W56=rand(1,NE56);
B56=rand(1);


for epocas=1:capa5
    for i=1:NP56
    a=W56*Pp56(:,i)+B56;
    e=T56(i)-a;
    W56=W56+2*alp*e*Pp56(:,i)';
    B56=B56+2*alp*e; 
    end
end

%gr1 X
%gr2 W
%gr3 V
T57=[3*ones(1,3) 2*ones(1,3) ones(1,3)];
Pp57(:,1:9)=Pp44(:,1:9);%gr2 VWX
[NE57,NP57]=size(Pp57);
W57=rand(1,NE57);
B57=rand(1);

for epocas=1:capa5
    for i=1:NP57
    a=W57*Pp57(:,i)+B57;
    e=T57(i)-a;
    W57=W57+2*alp*e*Pp57(:,i)';
    B57=B57+2*alp*e;
    end
end

%gr1 0
%gr2 Z
%gr3 Y
T58=[3*ones(1,3) 2*ones(1,3) ones(1,3)];
Pp58(:,1:9)=Pp44(:,10:18);%gr1 YZ0
[NE58,NP58]=size(Pp58);
W58=rand(1,NE58);
B58=rand(1);

for epocas=1:capa5
    for i=1:NP58
    a=W58*Pp58(:,i)+B58;
    e=T58(i)-a;
    W58=W58+2*alp*e*Pp58(:,i)';
    B58=B58+2*alp*e; 
    end
end

%gr1 2
%gr2 1
T59=[2*ones(1,3) ones(1,3)];
Pp59(:,1:6)=Pp46(:,1:6);%gr2 12
[NE59,NP59]=size(Pp59);
W59=rand(1,NE59);
B59=rand(1);

for epocas=1:capa5
    for i=1:NP59
    a=W59*Pp59(:,i)+B59;
    e=T59(i)-a;
    W59=W59+2*alp*e*Pp59(:,i)';
    B59=B59+2*alp*e; 
    end
end

%gr1 5
%gr2 4
T510=[2*ones(1,3) ones(1,3)];
Pp510(:,1:6)=Pp47(:,1:6);%gr2 45
[NE510,NP510]=size(Pp510);
W510=rand(1,NE510);
B510=rand(1);

for epocas=1:capa5
    for i=1:NP510   
    a=W510*Pp510(:,i)+B510;
    e=T510(i)-a;
    W510=W510+2*alp*e*Pp510(:,i)';
    B510=B510+2*alp*e; 
    end
end

%gr1 7
%gr2 6
T511=[2*ones(1,3) ones(1,3)];
Pp511(:,1:6)=Pp47(:,7:12);%gr2 67
[NE511,NP510]=size(Pp511);
W511=rand(1,NE511);
B511=rand(1);
er=0;
for epocas=1:capa5
    for i=1:NP510   
    a=W511*Pp511(:,i)+B511;
    e=T511(i)-a;
    W511=W511+2*alp*e*Pp511(:,i)';
    B511=B511+2*alp*e; 
    er=er+e;
    end
end

%gr1 9
%gr2 8
T512=[2*ones(1,3) ones(1,3)];
Pp512(:,1:6)=Pp48(1:1:6);%gr2 89
[NE512,NP512]=size(Pp512);
W512=rand(1,NE512);
B512=rand(1);

for epocas=1:capa5
    for i=1:NP512   
    a=W512*Pp512(:,i)+B512;
    e=T511(i)-a;
    W512=W512+2*alp*e*Pp512(:,i)';
    B512=B512+2*alp*e; 
    end
end


for i=1:102
   a11=round(W11*Pp(:,i)+B11);
   if (a11>1)
        a21=round(W21*Pp(:,i)+B21);
            if (a21>1)
                a31=round(W31*Pp(:,i)+B31);
                    if (a31>1)
                        a41=round(W41*Pp(:,i)+B41);
                    else
                        a42=round(W42*Pp(:,i)+B42);
                    end
            else
                a32=round(W32*Pp(:,i)+B32);
                    if(a32>1)
                        a43=round(W43*Pp(:,i)+B43);
                    else
                        a44=round(W44*Pp(:,i)+B44);
                    end
            end
   else
        a22=round(W22*Pp(:,i)+B22);
            if (a22>1)
                a33=round(W33*Pp(:,i)+B33);
                    if (a33>1)
                        a45=round(W45*Pp(:,i)+B45);
                    else
                        a46=round(W46*Pp(:,i)+B46);
                    end
            else
                a34=round(W34*Pp(:,i)+B34);
                    if (a34>1)
                        a47=round(W47*Pp(:,i)+B47);
                    else
                        a48=round(W48*Pp(:,i)+B48);
                    end
            end
   end
end