function process_2 = processKING(current,comb,NN_Count)

 l=size(current,2);
 
    for k =1:l
        
        current(:,l+1) = current(:,k);
        
        pvo = mode(current,2);
        
        p2(k,:) = (sum(pvo)/length(pvo))*100;
        
        p2(k,2:(NN_Count+1)) = comb;
        
    end
  
      p2 = num2cell(p2);
        
      for k = 1:l
          
          str = strcat(num2str(comb(k)),'T');
          
          p2(k,k+1) = {str};
          
      end
      
      process_2 = p2;
    
end

