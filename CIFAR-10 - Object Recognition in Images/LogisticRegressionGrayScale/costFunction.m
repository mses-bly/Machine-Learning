function [J, grad] = costFunction(theta, X, y, lambda)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.



% Initialize some useful values
m = length(y); % number of training examples

X_aux = [ones(m, 1) X];

J = 0;
grad = zeros(size(theta));

% Compute the cost of a particular choice of theta.

z = X_aux*theta;
partial1 = (-y).*	(sigmoid(z));
partial2 = -(1-y).*log(1-sigmoid(z));

theta_aux = theta;
theta_aux(1) = 0;
theta_aux = theta_aux.^2;

J = sum(partial1+partial2)/(m) + ((lambda/(2*m))*sum(theta_aux));

theta_aux = theta;
theta_aux(1) = 0;
nfeatures = length(theta);
h0 = sigmoid(z);
error = h0-y;
auxTheta = theta;
for j = 1 : nfeatures
    auxTheta(j) = sum (error.*X_aux(:,j));
end
grad = (1/m)*auxTheta + ((lambda/m)*theta_aux);


% =============================================================

end
