function [ error ] = computeError( X, y, Theta )
%COMPUTEERROR Summary of this function goes here
%   Detailed explanation goes here

m = size(X, 1); % Number of training examples
X_aux = [ones(m, 1) X];

[values,indexes] = max(sigmoid(X_aux*Theta),[],2);
predictedY = indexes-1;

aux = (predictedY-y).^2;
aux = aux(find (aux ~= 0));
aux = aux ./ aux;
error = sum(aux)/(m);

end

