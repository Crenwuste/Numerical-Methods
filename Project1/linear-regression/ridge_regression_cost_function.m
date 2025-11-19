function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  predict = FeatureMatrix * Theta(2:end);
  m = length(predict);
  Error = 0;

  for i = 1:m
    num = predict(i) - Y(i);
    num = num ^ 2;
    Error = Error + num;
  endfor

  Error = Error / 2 / m;

  sum = Theta' * Theta;
  sum = sum * lambda;

  Error = Error + sum;
endfunction
