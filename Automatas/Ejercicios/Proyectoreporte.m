%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%reporte
syms q1 q2 q3 q4 q5 q6 l1 l2a l2b l3 l4
syms c1 s1 c2 s2 c3 s3 c4 s4 c5 s5 c6 s6
syms r11 r12 r13 r21 r22 r23 r31 r32 r33 dx dy dz

M=[q1     ,l1 ,0   ,pi/2
   q2+pi/2,0  ,0   ,pi/2
   q3     ,l2a,l2b,0    
   q4     ,l3 ,0   ,-pi/2
   q5-pi/2,0  ,0   ,pi/2
   q6     ,l4 ,0   ,0];
    
%%%%%%%%%%%%%%%%separar
T01=rrz(M(1,1))*rtz(M(1,2))*rtx(M(1,3))*rrx(M(1,4));
T12=rrz(M(2,1))*rtz(M(2,2))*rtx(M(2,3))*rrx(M(2,4));
T23=rrz(M(3,1))*rtz(M(3,2))*rtx(M(3,3))*rrx(M(3,4));
T34=rrz(M(4,1))*rtz(M(4,2))*rtx(M(4,3))*rrx(M(4,4));
T45=rrz(M(5,1))*rtz(M(5,2))*rtx(M(5,3))*rrx(M(5,4));
T56=rrz(M(6,1))*rtz(M(6,2))*rtx(M(6,3))*rrx(M(6,4));

%%%%%%%%%%%%
TT01=subs(expand(T01),{cos(q1),sin(q1)},{c1,s1});
TT12=subs(expand(T12),{cos(q1),sin(q1),cos(q2),sin(q2)},{c1,s1,c2,s2});
TT23=subs(expand(T23),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3)},{c1,s1,c2,s2,c3,s3});
TT34=subs(expand(T34),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4)},{c1,s1,c2,s2,c3,s3,c4,s4});
TT45=subs(expand(T45),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4),cos(q5),sin(q5)},{c1,s1,c2,s2,c3,s3,c4,s4,c5,s5});
TT56=subs(expand(T56),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4),cos(q5),sin(q5),cos(q6),sin(q6)},{c1,s1,c2,s2,c3,s3,c4,s4,c5,s5,c6,s6});

T02=T01*T12;
T03=T02*T23;
T04=T03*T34;
T05=T04*T45;
T06=T05*T56;

%%%%%%%%%%%%%%%%%%%%cinematica directa
MT01=subs(expand(T01),{cos(q1),sin(q1)},{c1,s1});
MT02=subs(expand(T02),{cos(q1),sin(q1),cos(q2),sin(q2)},{c1,s1,c2,s2});
MT03=subs(expand(T03),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3)},{c1,s1,c2,s2,c3,s3});
MT04=subs(expand(T04),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4)},{c1,s1,c2,s2,c3,s3,c4,s4});
MT05=subs(expand(T05),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4),cos(q5),sin(q5)},{c1,s1,c2,s2,c3,s3,c4,s4,c5,s5});
MT06=subs(expand(T06),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4),cos(q5),sin(q5),cos(q6),sin(q6)},{c1,s1,c2,s2,c3,s3,c4,s4,c5,s5,c6,s6});

%%%%%%%%%%cinematica inversa
th3=pi;%primer angulo constante

M=[r11,r12,r13,dx
   r21,r22,r23,dy
   r31,r32,r33,dz
   0  ,  0,  0,1];%matriz conocida
R06c=M(1:3,1:3);%matriz rotacion conocida
  
ddx=M(1,4)-R06c(1,3);%posicion de la muñeca
ddy=M(2,4)-R06c(2,3);
ddz=M(3,4)-R06c(3,3);

Tp=subs(T03,{l1,l2a,l2b,l3,l4,q3},{3,3,-1,0,1,pi});%matriz 0 a 3 simbolica
TTp=subs(expand(Tp),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3)},{c1,s1,c2,s2,c3,s3});

ll1=3;%altura de la primera articulacion
th2=real(vpa((asin((ddz-ll1)/(sqrt(ddx^2+ddy^2+(ddz-ll1)^2)))-atan(1/3))));
% th2=round(th2*1000)/1000;
th1=real(vpa(atan2(ddy,ddx)));
% th1=round(th1*1000)/1000;

T03c=subs(Tp,{q1,q2},{th1,th2});%matriz 0 a 3 conocida

R03c=round(vpa(T03c(1:3,1:3))*1000)/1000;%matriz rotacion 0 a 3 cononcida
R36c=round((R03c\R06c)*1000)/1000;%matriz 3 a 6 conocida
if(i==1)
T36s=T34*T45*T56;%matriz 3 a 6 simbolica
end
TT36s=subs(expand(T36s),{cos(q1),sin(q1),cos(q2),sin(q2),cos(q3),sin(q3),cos(q4),sin(q4),cos(q5),sin(q5),cos(q6),sin(q6)},{c1,s1,c2,s2,c3,s3,c4,s4,c5,s5,c6,s6});
if(i==1)
R36s=expand(T36s(1:3,1:3));%matriz de rotacion  de 3 a 6 simbolica
end
th5=real(round(vpa(asin(R36c(3,3)))*1000)/1000);
th6=real(round(atan2(-R36c(3,2),R36c(3,1))*1000)/1000);
th4=real((round(vpa(asin(R36c(2,3)/(-cos(th5))))*1000)/1000));

