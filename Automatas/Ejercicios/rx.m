function [matx] = rx(deg)
an=(deg/180)*pi;
matx=[1,0,0;0,cos(an),-sin(an);0,sin(an),cos(an)];
end

