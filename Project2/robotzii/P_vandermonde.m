function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients

  n = length(x_interp);
  m = length(coef);

  % initializam matricea Vandermonde
  X = ones(n, m);
  for i = 1:n
    for j = 2:m
      X(i, j) = X(i, j-1) * x_interp(i);
    endfor
  endfor

  y_interp = X * coef;
endfunction
