n=9;
comb = 256;
clear currrent
% Counting zeros

for i=1:length(combs)

z=0;
for i = 1:n
    if combs(comb,i) == 0
        z=z+1;
    end
end

% Matrix width - number of zeros = number of NNs

w=n-z;
 
% Current matrix is set to the selected combination (row of matrix 'm')

for i=1:w
    
current(:,i) = labels_index(:,combs(comb,i));

end


% Process current matrix here










end

