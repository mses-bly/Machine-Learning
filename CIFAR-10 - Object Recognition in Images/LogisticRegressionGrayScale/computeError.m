function [ error ] = computeError( X, y, theta )
%COMPUTEERROR Summary of this function goes here
%   Detailed explanation goes here

m = size(X, 1); % Number of training examples
X_aux = [ones(m, 1) X];
aux = sigmoid(X_aux*theta);

error = sum((aux-y).^2)/(2*m);

end

