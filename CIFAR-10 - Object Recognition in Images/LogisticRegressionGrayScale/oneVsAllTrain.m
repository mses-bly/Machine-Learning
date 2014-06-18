function [ Theta ] = oneVsAllTrain( X,y,num_labels )
%ONEVSALLTRAIN Train multiclass classification

iterations = 10;
learningRate = 0.01;
%labels start at 0 and finish at num_labels -1
Theta = [];

for i = 0:num_labels-1
    [ cost,theta ] = stochasticTrain( X,(y==i), learningRate, iterations);
    Theta = [Theta,theta];
end

