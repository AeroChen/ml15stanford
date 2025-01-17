function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
% C_init = 1;
% sigma_init = 3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
min_err = 10;
for i = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30]'
    for j = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30]'
        C_temp = i;
        sigma_temp = j;
        model= svmTrain(X, y, C_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));
        pred = svmPredict(model,Xval);
        err = mean(double(pred~=yval));
        if err < min_err
            min_err = err;
            C = C_temp;
            sigma = sigma_temp;
        end
    end
end

% =========================================================================

end
