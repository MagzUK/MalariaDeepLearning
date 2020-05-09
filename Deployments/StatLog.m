function [champs,champ_vector,cvv] = StatLog(p,labels_index)

king = 0;

for i=1:11
   
    if iscell(p) == 1
        
    curr = cell2mat(p(1,i+1));
    
    else
        
        curr = p(1,i+1);
        
    end
    
    
    if isa(curr,'double') == 1
        
        if curr ~= 0 == 1
        
        champs(1,i) = curr; 
        
        
            
        end
    
    end
    
    if isa(curr,'char')
        
        if contains(curr,'T')
            
        curr = strrep(curr,'T','');
        curr = str2double(curr);
        champs(1,i) = curr;
        champs(1,13) = curr;
        
     
        
        else if contains(curr,'K')
                
          
        curr = strrep(curr,'K','');
        curr = str2double(curr);
        champs(1,i) = curr; 
        king = curr;
        
     
        
        
            else
        
            end
        end
    end
end

champs = champs(champs~=0);

if king ~= 0
    kl = length(champs);
    kd = kl -3;
    
    for i = 1:kd
        
    champs(kl+i) = king;
    
    end
    
end






for i = 1:length(champs)
     
champ_labels(:,i) = labels_index(:,champs(i));

end

champ_vector = mode(champ_labels,2);

cvv = (sum(champ_vector)/length(champ_vector))*100;

end






