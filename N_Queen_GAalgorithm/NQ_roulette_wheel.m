%%%%%%%%%%%%%%%%%%%%g_roulette_wheel.m
function[mating_pool]=NQ_roulette_wheel(population,N,selection_probability)
cdf(1)=selection_probability(1);
for i=2:N
    cdf(i)=cdf(i-1)+selection_probability(i);
end
for i=1:N
    q=rand;
    for j=1:N
        if q<=cdf(j)
            mating_pool(i,:)=population(j,:);
            break;
        end
    end
end

return;