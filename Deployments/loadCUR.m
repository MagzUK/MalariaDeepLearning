function current = loadCUR(i,labels_index,combs,combs_NNC)

% i             - Looped combination ID
% labels_index  - Complete classification table
% combs         - Full potential combination matrix
% combs_NNC     - NN count vector

clear current

current = zeros(length(labels_index),combs_NNC(i));

for k = 1:combs_NNC(i)
    
current(:,k) = labels_index(:,combs(i,k));

end

end
