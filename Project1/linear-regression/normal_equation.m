function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights

  % TODO: normal_equation implementation
  [~, n] = size(FeatureMatrix);
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;

  if ~issymmetric(A) || min(eig(A)) <= 0
    Theta = zeros(n + 1, 1);
    return;
  endif

  x = zeros(n, 1);
  r = b - A * x;
  v = r;
  tol_sqr = tol^2;
  k = 1;

  while k <= iter
    if r' * r <= tol_sqr
      break;
    endif

    t = (r' * r) / (v' * (A * v));
    x = x + t * v;
    r_new = r - t * (A * v);
    s = (r_new' * r_new) / (r' * r);
    v = r_new + s * v;
    r = r_new;
    k++;
  endwhile
  Theta = [0; x];
endfunction
