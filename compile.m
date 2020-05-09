function [NN_Folder,DS_Folder] = compile(NNdir)

fprintf('Compiling Resources...')

NN_Folder = dir([NNdir '/*.mat']);

DS_Folder = dir(['Datasets' '/*.mat']);


fprintf('Success!')

end

