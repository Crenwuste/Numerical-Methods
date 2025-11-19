function coef = vandermonde(x, y)
  % x = [x0, x1, ..., xn]'
  % y = [y0, y1, ..., yn]'
  % coef = [a0, a1, a2, ..., an]'

  % TODO: Calculate the Vandermonde coefficients

  n = length(x);

  %initializam cu 1 matricea Vandermonde
  matr_vand = ones(n, n);
  for i = 1:n
    for j = 2:n
      matr_vand(i,j) =  matr_vand(i, j-1) * x(i);
    endfor
  endfor

  coef = matr_vand \ y;
endfunction
