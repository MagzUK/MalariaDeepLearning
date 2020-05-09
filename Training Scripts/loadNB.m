function NetBank = loadNB(NN_Folder,NNdir)
    
NetBank = NeuralNetwork;
NN_Count = length(NN_Folder);

fprintf('\n Loading Neural Networks...')

for i=1:NN_Count

NetBank(i).ID = i;
NetBank(i).Name = NN_Folder(i).name;
Net = load(strcat(NNdir,'/',NN_Folder(i).name));
NetBank(i).Network = Net.TrainedNet;

end

fprintf('Success!')

end