function [X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = divideSet(  X, y )
%DIVIDESET This funtion takes the entire training set and divides it in training,
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


X_tr = X(1:tr_size,:);
y_tr = y(1:tr_size,:);

X_cv = X(tr_size+1:tr_size+cv_size,:);
y_cv = y(tr_size+1:tr_size+cv_size,:);

X_ts = X(tr_size+cv_size+1:end,:);
y_ts = y(tr_size+cv_size+1:end,:);

end

