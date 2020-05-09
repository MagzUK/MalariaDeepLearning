function [p1,oc] = processMODE(labels_index,combs,combs_NNC,NNC)

clear p1 oc; tic;

oc = [];
oc_nnc = [];

for i=1:length(combs)
    
    if mod(combs_NNC(i),2) ~= 0 && combs_NNC(i) > 1
    
    oc =  [oc;combs(i,:)];
    oc_nnc = [oc_nnc;combs_NNC(i)];
    
    end
    
end


for i=1:length(oc)
   
current = loadCUR(i,labels_index,oc,oc_nnc);

pvo = mode(current,2);

p1(i) = (sum(pvo)/length(pvo))*100;

end

p1 = p1.';

p1(:,2:(NNC+1)) = oc;

p1 = sortrows(p1,'descend');

completion = cell2mat(strcat('\n Process 1 took',{' '},num2str(toc),' seconds to complete...'));

fprintf(completion)

end