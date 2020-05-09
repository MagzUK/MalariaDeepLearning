function labels = classify(NN_Folder,DS_Folder,NetBank,Data)

tic;
fprintf('\n Running Classifications...')

NNC = length(NN_Folder);

for i=1:NNC
    
net = NetBank(i).Network;  
if iscell(net) == 1
net = net{1};
end

inputSize = net.Layers(1).InputSize;

for j=1:length(DS_Folder)

imgs = Data.IDSEnsemble;     % Change to Data(j) when more than one dataset is available. 

aug_imgs = augmentedImageDatastore(inputSize(1:2),imgs);

labels(:,i) = classify(net,aug_imgs);
 
end

fprintf('\n %.f/%.f completed...',i,NNC);

end

fprintf(' \n Success!')
completion = cell2mat(strcat('\n Classification took',{' '},num2str(toc),' seconds to complete...'));

fprintf(completion)

end

