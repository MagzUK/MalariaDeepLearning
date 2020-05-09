% 95.82%
% 95.83% - edited 0.7 split ep10
% 96.03% - edited 0.9 split ep10
% 96.1% - edited 0.9 split ep20
% 96.43% -  - edited 0.95 split ep10
% 95.92 - edited 0.95 split ep50
%96.5% - edited 0.95 split ep10 weight/bias5 

net = alexnet;


DS_Folder = dir(['Datasets' '/*.mat']);
Data = loadDS(DS_Folder);
imds = Data.IDSTrainNN;

[imdsTrain,imdsValidation] = splitEachLabel(imds,0.8,'randomized');

inputSize = net.Layers(1).InputSize;

layersTransfer = net.Layers(1:end-3);

numClasses = numel(categories(imdsTrain.Labels));

layers = [
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',10,'BiasLearnRateFactor',10)
    softmaxLayer
    classificationLayer];

pixelRange = [-30 30];
imageAugmenter = imageDataAugmenter( ...
    'RandXReflection',true, ...
    'RandXTranslation',pixelRange, ...
    'RandYTranslation',pixelRange);
augimdsTrain = augmentedImageDatastore(inputSize(1:2),imdsTrain, ...
    'DataAugmentation',imageAugmenter);

augimdsValidation = augmentedImageDatastore(inputSize(1:2),imdsValidation);

options = trainingOptions('sgdm', ...
    'MiniBatchSize',50, ...
    'MaxEpochs',4, ...
    'InitialLearnRate',0.0001, ...
    'Shuffle','every-epoch', ...
    'ValidationData',augimdsValidation, ...
    'ValidationPatience', Inf, ...
    'ValidationFrequency',100, ...
    'Verbose',false, ...
    'Plots','training-progress');

for i=1:50
Alex(i) = trainNetwork(augimdsTrain,layers,options);
end

