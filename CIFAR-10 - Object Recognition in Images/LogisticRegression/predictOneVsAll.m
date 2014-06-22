function [ predictedY] = predictOneVsAll( X,Theta )
%PREDICTONEVSALL Make a multiclassPrediction
 
X_aux = [ones(size(X,1), 1) X];

[values,indexes] = max(sigmoid(X_aux*Theta),[],2);
predictedY = indexes-1;

