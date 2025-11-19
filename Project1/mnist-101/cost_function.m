function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

  % TODO: cost_function implementation

  % TODO1: get Theta1 and Theta2 (from params). Hint: reshape
  Theta1_size = hidden_layer_size * (input_layer_size + 1);
  Theta1 = params(1:Theta1_size);
  Theta2 = params(Theta1_size+1:end);

  Theta1 = reshape(Theta1, hidden_layer_size, input_layer_size + 1);
  Theta2 = reshape(Theta2, output_layer_size, hidden_layer_size + 1);

  % TODO2: Forward propagation
  [rows, ~] = size(X);
  a1 = [ones(rows, 1), X];
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2 = [ones(rows, 1), a2];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);

  % TODO3: Compute the error in the output layer and perform backpropagation
  y_vec = zeros(rows, output_layer_size);
  for i = 1:rows
    y_vec(i, y(i)) = 1;
  endfor

  delta3 = a3 - y_vec;
  delta2 = (delta3 * Theta2) .* sigmoid_derivate([ones(rows, 1), z2]);
  delta2 = delta2(:, 2:end);

  Delta2 = delta3' * a2;
  Delta1 = delta2' * a1;

  % TODO4: Determine the gradients
  Theta1_grad = Delta1 / rows;
  Theta2_grad = Delta2 / rows;
  Theta1_grad(:, 2:end) += (lambda / rows) * Theta1(:, 2:end);
  Theta2_grad(:, 2:end) += (lambda / rows) * Theta2(:, 2:end);

  % TODO5: Final J and grad
  J = sum(sum(-y_vec .* log(a3) - (1 - y_vec) .* log (1 - a3)));
  reg = (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));
  J = J / rows + reg * lambda / (2 * rows);

  grad = [Theta1_grad(:); Theta2_grad(:)];

endfunction

function [r] = sigmoid_derivate(x)
  r = sigmoid(x) .* (1 - sigmoid(x));
endfunction
