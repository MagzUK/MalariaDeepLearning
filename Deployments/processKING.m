function p3 = processKING(labels_index,combs,combs_NNC,NNC)

clear p3; tic;

p3 = []; kc = []; kc_nnc = [];

for i=1:length(combs)
    
    if combs_NNC(i) > 4
    
    kc =  [kc;combs(i,:)];
    
    kc_nnc = [kc_nnc;combs_NNC(i)];
    
    end
    
end

clear p3d_temp p3_temp

for i=1:length(kc)

current = loadCUR(i,labels_index,kc,kc_nnc);

lk=size(current,2);
 
    for k=1:lk
        
        for j=1:lk-3
            
        current(:,lk+j) = current(:,k);
        
        end
        
        pvo = mode(current,2);
        
        p3d_temp(k,1) = (sum(pvo)/length(pvo))*100;
        
        p3d_temp(k,2:(NNC+1)) = kc(i,:); 
       
    end
    
    p3_temp = num2cell(p3d_temp);
    
    for k = 1:kc_nnc(i)
          
        str = strcat(num2str(kc(i,k)),'P');
          
        p3_temp(k,k+1) = {str};
             
    end
    
    p3 = [p3;p3_temp];

end

    p3 = sortrows(p3,1,'descend');

    completion = cell2mat(strcat('\n Process 3 took',{' '},num2str(toc),' seconds to complete...'));

    fprintf(completion)
    
end
  

