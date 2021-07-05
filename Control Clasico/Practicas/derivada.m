function dfx =derivada(fx,dt)

for i=1:length(fx)-1
    dfx(i)=(fx(i+1)-fx(i))/dt;
end
dfx(i+1)=dfx(i);
end

