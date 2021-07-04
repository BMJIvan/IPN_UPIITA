function [tz] = rtz(N)
tz=sym(eye(4));
tz(3,4)=N;
end
