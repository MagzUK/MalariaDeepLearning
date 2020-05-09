for i = 1:9
    
   champ_vector = dir('Champs/pbs');
   cv = load(strcat('Champs/pbs/',champ_vector(i+2,1).name));
   cv = cv.champ_vector;
    labels_index(:,i) = cv(:,1); 
    
end