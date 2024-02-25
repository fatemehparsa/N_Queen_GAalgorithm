%%%%%%%%%%%%%%%%%%%%%%%%%%%fit_eval.m
function[selection_probability,fit,avg_fit,max_fit,opt_sol]=NQ_fit_eval(Population,N,L)
for i=1:N
    c=0;

   X = Population(i,:);
   for j=0:3:L-1
       for k=0:3:L-1
           if k~=j && X(j)==X(k)
               c=c+1;
           end
           if k~=j && X(j+1)==X(k+1)
               c=c+1;
           end
           if k~=j && X(j+2)==X(k+2)
               c=c+1;

           end
       end
   end
   fit(i)=3*factorial(L/3)-c;
end
selection_probability=fit/sum(fit);
avg_fit=mean(fit);
[max_fit,max_loc]=max(fit);
opt_sol=Population(max_loc,:);
return;
