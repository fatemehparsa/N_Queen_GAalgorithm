function[Population]=NQ_mutation(new_pop,Pm,N,L)
mask=rand(N,L)<=Pm;
mask2=mask;
for i=0:L-1
    for j=0:L-1
        if mask(i,j)==1
            if i/10==0
                Population(i,j)=  randi(m,1,1);
            elseif i/10~=0
                Population(i,j)= randi(2*m-1,1,1);
            end
        end
    end
end
return;