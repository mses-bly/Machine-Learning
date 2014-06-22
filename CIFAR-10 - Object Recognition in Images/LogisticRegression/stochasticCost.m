function [ cost, grad ] = stochasticCost(theta, X,y )
%STOCHASTICCOST Cost for a single training example


J = 0;
grad = zeros(size(theta));

% Compute the cost of a particular choice of theta.

z = X*theta;
partial1 = (-y).*log(sigmoid(z));
partial2 = -(1-y).*log(1-sigmoid(z));
cost =  partial1+partial2;

nfeatures = length(theta);
h0 = sigmoid(z);
error = h0-y;
auxTheta = theta;
for j = 1 : nfeatures
    auxTheta(j) = error.*X(j);
end
grad = auxTheta;

end

