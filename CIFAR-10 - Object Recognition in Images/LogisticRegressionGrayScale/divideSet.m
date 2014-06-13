function [X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = divideSet( X, y)
%This funtion takes the entire training set and divides it in training,
%cross validation and test sets, following a 60-20-20 division rule.

X_tr = [];
y_tr = [];
X_cv = [];
y_cv = [];
X_ts = [];
y_ts = [];

%total set size
m = size(X,1);

%training size
tr_size = round(0.6*m);
%cross validation size
cv_size = round(0.5*(m-tr_size));
%test size
ts_size = m - cv_size - tr_size;


%random shuffle of the initial set rows

p = randperm(m);
p_tr = p(1:tr_size);
p_cv = p(tr_size+1:tr_size+cv_size);
p_ts = p(tr_size+cv_size+1:end);

%load training set
for i = 1 : size(p_tr,2)
    index = p_tr(i);
    X_tr = [X_tr; X(index,:)];
    y_tr =  [y_tr; y(index,:)];
end

%load cross validation set
for i = 1 : size(p_cv,2)
    index = p_cv(i);
    X_cv = [X_cv; X(index,:)];
    y_cv=  [y_cv; y(index,:)];
end

%load test set

for i = 1 : size(p_ts,2)
    index = p_ts(i);
    X_ts = [X_ts; X(index,:)];
    y_ts =  [y_ts; y(index,:)];
end

end

