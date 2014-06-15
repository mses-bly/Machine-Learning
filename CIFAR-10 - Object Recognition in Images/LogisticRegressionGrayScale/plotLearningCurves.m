function [] = plotLearningCurves( X,y, learningRate, iterations)
%PLOTLEARNINGCURVES Given theta, the training set and the cross validation
%set, plots the learning curves in order to determine high variance or high
%bias
t_s = [];
cv_error = [];
tr_error = [];

for i=100:50:length(y)
    
    t_s = [t_s;i];
    
    [X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = divideSet( X(1:i,:), y(1:i,:));
    
    [ cost,theta] = stochasticTrain( X_tr,y_tr, learningRate, iterations);
    
    cv_error = [cv_error;computeError(X_cv,y_cv,theta)];
    
    tr_error = [tr_error;computeError(X_tr,y_tr,theta)];

end

figure
plot(t_s,cv_error,t_s,tr_error);