function p2 = processTIEB(labels_index,combs,combs_NNC,NNC)

clear p2; tic;

p2d = []; p2 = []; tc = []; tc_nnc = [];

for i=1:length(combs)
    
    if mod(combs_NNC(i),2) == 0 && combs_NNC(i) > 2
    
    tc =  [tc;combs(i,:)];
    tc_nnc = [tc_nnc;combs_NNC(i)];
    
    end
    
end

clear p2d_temp p2_temp

for i=1:length(tc)

current = loadCUR(i,labels_index,tc,tc_nnc);

l=size(current,2);
 
    for k=1:l
        
        current(:,l+1) = current(:,k);
        
        pvo = mode(current,2);
        
        p2d_temp(k,1) = (sum(pvo)/length(pvo))*100;
        
        p2d_temp(k,2:(NNC+1)) = tc(i,:); 
       
    end
    
    
    p2_temp = num2cell(p2d_temp);
    
    
    
    for k = 1:tc_nnc(i)
          
        str = strcat(num2str(tc(i,k)),'T');
          
        p2_temp(k,k+1) = {str};
             
    end
    
    p2 = [p2;p2_temp];

end

    p2 = sortrows(p2,1,'descend');

    completion = cell2mat(strcat('\n Process 2 took',{' '},num2str(toc),' seconds to complete...'));

    fprintf(completion)
    
end
  

