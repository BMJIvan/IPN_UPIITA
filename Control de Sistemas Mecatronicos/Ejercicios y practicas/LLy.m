function [L] = LLy(A,C,polos)
pr=real(polos);
pi=imag(polos);

n=size(A,1);

cont=0;
F=zeros(n,n);
for i=1:n-1
    F(i,i)=pr(i);
    F(i+1,i)=pi(i);
    F(i,i+1)=-pi(i);
    
    if(pi(i)==0)
        for j=1:n
           if(pr(i)==pr(j))
               cont=cont+1;
           end
        end
        if (cont>=2)
            F(i,i+1)=1;
        end
        cont=0;
    end
end
F(i+1,i+1)=pr(i+1);

Lr=zeros(n,1);
for i=1:n
   Lr(i)=real(pr(i)); 
end

P=lyap(-F,A,-Lr*C);
L=P\Lr;
end