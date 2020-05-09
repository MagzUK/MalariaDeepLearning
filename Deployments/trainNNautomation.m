 
if ~exist(newSubFolder, 'dir')
  mkdir(newSubFolder);
end

folname = 'Squeezenets\';
fol = dir('Squeezenets\');

for i = 8:12

TrainedNet = trainedNet{i};

filename = strcat('Squeezenet_',num2str(i));

file = strcat('C:\\Users\cch85\Desktop\MalariaDL\Deployments\',filename,'.mat');

save(file,'TrainedNet');

end