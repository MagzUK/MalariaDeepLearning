
[champs,champ_vector,cvv] = StatLog(p,labels_index);


save(strcat(NNdir,'_p.mat'),'champ_vector')
save(strcat(NNdir,'_p_table.mat'),'p')
