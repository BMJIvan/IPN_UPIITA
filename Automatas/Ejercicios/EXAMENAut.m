clc
close all 

T0=trotx(0);
tranimate(T0,T0)
hold on
axis([-.1,3,-.1,3,-.1,3])

T02=troty(90)*transl(-2,0,0);
tranimate(T02)

T01=trotz(-180)*transl(-1,-2,0);
tranimate(T01)

T12=T01*trotz(180)*troty(90)*transl(-2,-2,-1);
tranimate(T01,T12)

T21=T02*troty(-90)*trotz(180)*transl(2,2,1);
tranimate(T02,T21)

T20=T02*troty(-90)*transl(0,0,-2);
tranimate(T02,T20)

