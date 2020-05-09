function labels_index = classindex(labels,Data)

fprintf('\n Forming binary matrix...')

img_count = size(Data.IDSEnsemble.Files,1);

for i=1:img_count 
labels_index(i,:)=grp2idx(labels(i,:))-1; 
end

for i=1:img_count/2
labels_index(i,:) = 1-labels_index(i,:);
end

fprintf('Success!')

end