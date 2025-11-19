function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers

  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter

  % TODO: predict_classes implementation
  Theta1_size = hidden_layer_size * (input_layer_size + 1);
  Theta1 = weights(1:Theta1_size);
  Theta2 = weights(Theta1_size+1:end);

  Theta1 = reshape(Theta1, hidden_layer_size, input_layer_size + 1);
  Theta2 = reshape(Theta2, output_layer_size, hidden_layer_size + 1);

  num_labels = size(Theta2, 1);
  [rows, ~] = size(X);

  a1 = [ones(rows, 1), X];
  z2 = a1 * Theta1';
  a2 = sigmoid(z2);
  a2 = [ones(rows, 1), a2];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);
  [~, classes] = max(a3, [], 2);
endfunction
