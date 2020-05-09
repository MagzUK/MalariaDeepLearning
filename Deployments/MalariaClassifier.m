clear errata errata_imgStore errata_paths err_imgs

nn = {'Resnet18'};

% 'Resnet50', 'Resnet101'


fol = 'Parasitized';

imgs = imageDatastore(fol);

testCount = size(dir([fol '/*.png']),1);

% Looping over the neural network array

for n =1:length(nn)

net = struct2cell(load(strcat('TrainedNetworks/',nn{n},'_trained.mat')));

net = net{1};

inputSize = net.Layers(1).InputSize;

aug_imgs = augmentedImageDatastore(inputSize(1:2),imgs);

labels = classify(net,aug_imgs);

j=1;

for i = 1:testCount
    
    if strcmp(char(labels(i,1)),fol) == 0
          
        errata(j,n) = i;
       
        j = j + 1;
        
    end
          
end

clear i j 

for i = 1:length(errata)
   
   errata_paths{i,n}= imgs.Files{errata(i,n)} ;
    
end

clear i

paths = errata_paths{:,n};

imgStore = imageDatastore(paths);

err_imgs = readall(imgStore);

figure(n)

montage(err_imgs)

end


