clc
clear all
close all

hold on
for k=0:200
  clc
    num=[k 4*k 0];
   den=[(1+k) (2+4*k) 2];
   Gs=tf(num,den);
   %pzmap(Gs)
  y=step(Gs,0:.1:60);
  plot(0:.1:60,y)
  title(num2str(k))
   pause(.1)
end

   

% 
% hold on
% for k=1:1
%    num=[1 4 0];
%    den=[1 2 2 ];
%    Gs=tf(num,den);
%    rlocus(Gs);
% end
% 
%     hold off