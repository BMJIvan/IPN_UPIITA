function [matz] = rz(deg)
an=(deg/180)*pi;
matz=[cos(an),-sin(an),0;sin(an),cos(an),0;0,0,1];
end

