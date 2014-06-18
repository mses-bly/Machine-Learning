function [ X,y ] = shuffle( X,y )
%SHUFFLE Shuffle X

m = size(X,1);

p = randperm(m);

X_aux = [];
y_aux = [];
for i = 1 : m
    index = p(i);
    X_aux = [X_aux; X(index,:)];
    y_aux = [y_aux;y(index,:)];
end
X = X_aux;
y = y_aux;
end

