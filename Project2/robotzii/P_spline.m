function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients

  % transformam matricea de coef intr o matrice de nx4 pt a fi mai usor de accesat
  new_coef = reshape(coef, 4, []);

  n = length(x_interp);
  m = length(x) - 1;

  for i = 1:n
    for k = 1:m
      if  x(k) <= x_interp(i) && x_interp(i) <= x(k+1)
        j = k;
        break;
      endif
    endfor
    % extragem parametrul local si coeficientii acesteia
    var = x_interp(i) - x(j);

    a = new_coef(1, j);
    b = new_coef(2, j);
    c = new_coef(3, j);
    d = new_coef(4, j);

    y_interp(i) = a + b * var + c * var^2 + d * var^3;
  endfor
endfunction
