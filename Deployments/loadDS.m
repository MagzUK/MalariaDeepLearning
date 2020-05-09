function Data = loadDS(DS_Folder)

fprintf('\n Loading Datasets...')



DS_Count = length(DS_Folder);

Data = Dataset;

for i=1:1

    if exist(strcat('C:\\Users\cch85\Desktop\MalariaDL\Deployments\Datasets\DataObjV',num2str(i),'.mat'),'file') == 2
        
        Data = load(strcat('C:\\Users\cch85\Desktop\MalariaDL\Deployments\Datasets\DataObjV',num2str(i),'.mat'));
        
        Data = Data.Data;
        
        fprintf('Success!')
        
    else
      
        Data(i).ID = i;
        Data(i).Name = strcat('Version',' ','1');
        Data(i).Description = '';
        Data(i).IDSS = load(strcat('Datasets\',DS_Folder(i).name));

        Data.IDS_Main = Data(i).IDSS.DataIDS;

        [IDSTrain,IDSEnsem] = splitEachLabel(Data.IDS_Main,(5/6),'randomized');

        Data.IDSTrainNN = IDSTrain;
        Data.IDSEnsemble = IDSEnsem;

        fprintf('Success!')


    end
    
end



