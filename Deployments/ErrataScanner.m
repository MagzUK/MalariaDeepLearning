labels = labels_index(:,5);
errata = [];
for i = 1:length(labels)
    if labels(i) == 0
        if strmatch(string(Data.IDSEnsemble.Labels(i)),'Parasitized') == 1
        errata=[errata;i];
        end
    end
end


for i=1:length(errata)
    
errata_img_paths(i) = Data.IDSEnsemble.Files(i);


end

for i=1:length(errata)
    
str = string(errata_img_paths{1,i})
errata_str(1,i) = str

end

img_array = {};


for i=1:length(errata)
   a = {imread(errata_str(1,i))};
   img_array = [img_array a ];
    
end

figure(1)
montage(img_array)

labels = labels_index(:,5);
errata = [];
for i = 1:length(labels)
    if labels(i) == 0
        if strmatch(string(Data.IDSEnsemble.Labels(i)),'Uninfected') == 1
        errata=[errata;i];
        end
    end
end


for i=1:length(errata)
    
errata_img_paths(i) = Data.IDSEnsemble.Files(i);


end

for i=1:length(errata)
    
str = string(errata_img_paths{1,i})
errata_str(1,i) = str

end

img_array = {};


for i=1:length(errata)
   a = {imread(errata_str(1,i))};
   img_array = [img_array a ];
    
end

figure(2)
montage(img_array)