function [ precision, recall, score, error, accuracy] = predictionAnalysis( X, y , theta)
%PREDICTIONANALYSIS This function analyses our prediction result for binary
%classes

actual = y;

predicted = predict(theta,X);

% for i=1:length(predicted)
%     if predicted(i) == 1
%         figure(i)
%         drawImage(X(i,:),32)
%     end
% end

true_positive = sum(actual.*predicted);

false_positive = sum(predicted(find(actual == 0)));

false_negative = sum(actual(find(predicted == 0)));

true_negative = sum(predicted(find(actual == 0))==0);

precision = true_positive/(true_positive+false_positive);

recall =  true_positive/(true_positive+false_negative);

score = 2*((precision*recall)/(precision+recall));

error = computeError(X, y, theta);

accuracy = (true_positive+true_negative)/length(actual);

end

