function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer

  % matrix -> the matrix with random values

  % TODO: initialize_weights implementation
  eps = sqrt(6) / sqrt(L_prev + L_next);
  for i = 1:L_prev + 1
    for j = 1:L_next
      matrix(i, j) = -eps + 2 * eps * rand();
    endfor
  endfor
endfunction
