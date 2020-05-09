NNdir = 'HPI';

[NN_Folder,DS_Folder] = compile(NNdir);

NNC = length(NN_Folder);

NetBank = loadNB(NN_Folder,NNdir);

Data = loadDS(DS_Folder);

labels = classify(NN_Folder,DS_Folder,NetBank,Data);

labels_index = classindex(labels,Data);

NNC=9

[combs,combs_NNC] = combis(NNC);

p1 = processMODE(labels_index,combs,combs_NNC,NNC);

p2 = processTIEB(labels_index,combs,combs_NNC,NNC);

p3 = processKING(labels_index,combs,combs_NNC,NNC);

p = sortrows([num2cell(p1); p2; p3],1,'descend');

ps = processSOLO(labels_index,combs,combs_NNC,NNC);

figure(1)

histogram(p1(:,1),70)

figure(2)

histogram(cell2mat(p2(:,1)),70)

figure(3)

histogram(cell2mat(p3(:,1)),70)

figure(4)

histogram(cell2mat(p(:,1)),100)





