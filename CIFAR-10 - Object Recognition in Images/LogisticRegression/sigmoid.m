function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon
%   J = SIGMOID(z) computes the sigmoid of z.

g = zeros(size(z));
%Compute the sigmoid of each value of z (z can be a matrix,vector or scalar).
ez = exp(-z);
denominator = 1 + ez;
g = 1 ./ denominator;




% =============================================================

end
