disp('Loading data.........................................................')

[X,y] = loadData('nada','nada');
[X_tr, y_tr, X_cv, y_cv, X_ts, y_ts] = divideSet( X, y);

disp('Done loading data.....................................................')

[m, n] = size(X_tr);

initial_theta = zeros(n + 1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 400,'Display','notify-detailed');

disp('Calculating theta....................................................')

lambdas = [];
tr_errors = [];
cv_errors = [];

lambda = 0.01;

while lambda <= 10
    fprintf('Lamda = %f\n',lambda);
    tic
    [theta, cost,exit_flag] = fminunc(@(t)(costFunction(t, X_tr, y_tr,lambda)), initial_theta, options);  
     fprintf('Time: %f\n',toc);
    [tr_precision, tr_recall, tr_score, tr_error] = predictionAnalysis(X_tr,y_tr, theta);
    [cv_precision, cv_recall, cv_score, cv_error] = predictionAnalysis(X_cv,y_cv, theta);
    
    lambdas = [lambdas;lambda];
    tr_errors = [tr_errors;tr_error];
    cv_errors = [cv_errors;cv_error];
    lambda = lambda*2;
end

disp('Done.................................................................')




