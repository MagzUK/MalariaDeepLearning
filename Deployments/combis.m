function [combs,combs_NNC] = combis(NNC)

fprintf('\n Calculating ensemble combinations...')


n = NNC;
nm = 1:1:n;


for k=1:n
   
   a = nchoosek(n,k);
   
   t1 = zeros(a,n);
   t2 = nchoosek(nm,k);
  
   j=1;
   
   while j<=k
       t1(:,j) = t2(:,j);
       j=j+1;
   end
   
   if k > 1
       combs = [combs;t1];
   else    
       combs = t1;
   end
        
   combs_NNC = zeros(1,length(combs));
   
   for i = 1:length(combs)
      
       combs_NNC(i) = NNC - sum(combs(i,:)==0);
       
   end
   
   
end

  
   fprintf('Success!')
   
end