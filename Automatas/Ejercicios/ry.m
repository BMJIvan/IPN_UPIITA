function [maty] = ry(deg)
an=(deg/180)*pi;
maty=[cos(an),0,sin(an);0,1,0;-sin(an),0,cos(an)];
end

