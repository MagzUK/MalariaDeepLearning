function ps = processSOLO(labels_index,combs,combs_NNC,NNC)

clear p1 oc; tic;

oc = [];
oc_nnc = [];

for i=1:length(combs)
    
    if combs_NNC(i) == 1
    
    oc =  [oc;combs(i,:)];
    oc_nnc = [oc_nnc;combs_NNC(i)];
    
    end
    
end


for i=1:length(oc)
   
current = loadCUR(i,labels_index,oc,oc_nnc);

pvo = mode(current,2);

ps(i) = (sum(pvo)/length(pvo))*100;

end

ps = ps.';

ps(:,2:(NNC+1)) = oc;

ps = sortrows(ps,'descend');

completion = cell2mat(strcat('\n Process 1 took',{' '},num2str(toc),' seconds to complete...'));

fprintf(completion)

end