function [ cost,theta ] = stochasticTrain( X,y, learningRate, iterations)
%STOCHASTICTRAIN Stochastic gradient descent.

[m, n] = size(X);

theta = zeros(n + 1, 1);

X_aux = [ones(m, 1) X];

for iter=1:iterations
    for i=1:m
        [ cost, grad ] = stochasticCost(theta, X_aux(i,:),y(i,:));
        theta = theta-learningRate*grad;
    end
end
end

