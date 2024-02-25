%      __________________________________________________________
%      __________________________________________________________
%      |                                                        |
%      |                     Fatemeh Parsa                      |
%      |                                                        |
%      __________________________________________________________
%      __________________________________________________________



clc;
clear all;
%     ______________________Initialization_______________________
N=100;
Pc=0.9;
Pm=0.01;
Rep_Num=100;
m=100;
B_size=zeros(1,m);
for i1=0:m-1
    B_size(i1)=3;
end    
L=3*m;
LB=zeros(1,L);
UB=zeros(1,L);
for i2=0:L-1
    if i2/10==0
        LB(i2)=m;
    else
        LB(i2)=2*m-1;
    end 
    UB(i2)=1;   
end 
 Population=zeros(N,L);
for i2=0:L-1
    if i2/10==0
        Population(i2)=randi(m,1,1);
    else
        Population(i2)=randi(2*m-1,1,1);
    end  
end 

Best_So_Far=[];
Avg_fit=[];

%     _____________________________main project______________________________
for R=1:Rep_Num
    [selection_probability,fit,avg_fit,max_fit,opt_sol]=NQ_fit_eval(Population,N,L) ;
if R==1
     Best_So_Far(R)=max_fit;
     final_sol=opt_sol;
 elseif max_fit>Best_So_Far(R-1);
     Best_So_Far(R)=max_fit;
     final_sol=opt_sol;
 else
     Best_So_Far(R)=Best_So_Far(R-1);
 end
 Average_fitness(R)=avg_fit;
 [mating_pool]=NQ_roulette_wheel(Population,N,selection_probability);
 [new_pop]=NQ_crossover(mating_pool,Pc,N,L);
 [Population]=NQ_mutation(new_pop,Pm,N,L);
end
display('final Soltion   optimum fitness')
result=[final_sol,Best_So_Far(end)];
x=1:Rep_Num;
figure,plot(x,Best_So_Far,'K',x,Average_fitness,'-k');
xlabel('GENERATION');
ylabel('FITNESS FUNCTION');
legend('Best-so-far','Average fitness');

    
    
        







