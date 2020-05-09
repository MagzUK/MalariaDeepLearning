for i = 13:50
    TrainedNet = Alex(i);
str = strcat('Alex_',num2str(i),'.mat');
save(str,'TrainedNet');
end