function [ty] = rty(N)
ty=sym(eye(4));
ty(2,4)=N;
end
