function [] = convergenceAnalysis( X,y )
%CONVERGENCEANALYSIS Plot graphics to analyse the learning rate for
%stochastic gradient descent.
learningRate = 0.0001;
p = 0;
while learningRate <= 1;
    [m, n] = size(X);
    theta = zeros(n + 1, 1);
    X_aux = [ones(m, 1) X];
    iterations = [];
    costs = [];
    j = 0;
    acc_cost = 0;
    for i=1:m
        [ cost, grad ] = stochasticCost(theta, X_aux(i,:),y(i,:));
        %modify j >= value to get less noisy plots
        if j >= 380
            costs = [costs;acc_cost/j];
            iterations = [iterations;i];
            acc_cost = 0;
            j = 0;
        end
        acc_cost = acc_cost + cost;
        j = j+1;
        %theta = theta-learningRate*grad;
        theta = theta-learningRate*grad;     
    end
    p = p+1;
    learningRate = learningRate * 3;
    figure(p);
    plot(iterations,costs);
    fprintf('Learning rate %f -> Image %d\n',learningRate,p);   
end

end

