function [] = plotErrorCurves( X,y, learningRate, iterations)
%PLOTLEARNINGCURVES Given theta, the training set and the cross validation
%set, plots the learning curves in order to determine high variance or high
%bias
t_s = [];
cv_error = [];
tr_error = [];
%modify step and max val to get more informative plots
for i=1 :2500:45000%length(y)
    fprintf('%d\n',i);
    t_s = [t_s;i];
    tr_size = round(0.9*size(X(1:i,:),1));
    X_tr = X(1:tr_size,:);
    y_tr = y(1:tr_size,:);
    X_cv = X(tr_size+1:size(X(1:i,:),1),:);
    y_cv = y(tr_size+1:size(X(1:i,:),1),:);
    %[X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = divideSet( X(1:i,:), y(1:i,:));
    
    %[ cost,theta] = stochasticTrain( X_tr,y_tr, learningRate, iterations);
    
    [ Theta ] = oneVsAllTrain( X_tr,y_tr,10);
    
    cv_error = [cv_error;(computeError(X_cv,y_cv,Theta))/length(y(1:i,:))];
    
    tr_error = [tr_error;(computeError(X_tr,y_tr,Theta))/length(y(1:i,:))];

end

figure
plot(t_s,cv_error,t_s,tr_error);