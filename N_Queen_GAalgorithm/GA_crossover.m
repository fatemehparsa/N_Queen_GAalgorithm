%%%%%%%%%%%%%5g_crossover.m
function[new_pop]=NQ_crossover(mating_pool,Pc,N,L)
parent_num=randperm(N);
for j=1:2:N
    pointer1=parent_num(j);
    pointer2=parent_num(j+1);
    cut_point=randint(1,1,L);
    off1=mating_pool(pointer1,:);
    off2=mating_pool(pointer2,:);
    if rand<Pc
        temp=off2;
        off2(cut_point+1:end)=off1(cut_point+1:end);
        off1(cut_point+1:end)=temp(cut_point+1:end);
    end
    new_pop(j,:)=off1;
    new_pop(j+1,:)=off2;
end
return;