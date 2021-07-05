clc
clear all
close all

% hold on
% for k=0:.1:5
%    
%     Gs=tf([k],[1 3 2 k]);
%     pzmap(Gs)
%     axis([-5 5 -5 5])
%     drawnow
%     pause(.01)
% end
% hold off
figure,
hold on
for k=0:.02:100

R=roots([1 6 11 6+k]);
plot([real(R)],[imag(R)],'b*');

Z=roots([k]);
plot([real(Z)],[imag(Z)],'ro');

plot([-100 100],[0 0],'k');
plot([0 0],[-100 100],'k');
%drawnow
axis([-5 5 -5 5])

for l=1:length(R)
S=R(l);
Go=(k)/(S*(S+2)+k*(S+1));
end
end