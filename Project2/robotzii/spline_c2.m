function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

  interval = length(x) - 1;
  n = 4 * interval;
  X = sparse(n, n);
  Y = sparse(n, 1);

	% TOOD 1: si(xi) = yi, i = 0 : n - 1
  % inseamna ca an = yn
  for i = 0:interval-1
    X(i+1, i*4 + 1) = 1;
    Y(i+1) = y(i+1);
  endfor
	% TODO 2: s_n-1(xn) = yn
  val = x(end) - x(end - 1); % xn - xn-1
  col = 4 * (interval-1) + 1; % col

  X(interval+1, col) = 1;
  X(interval+1, col + 1) = val;
  X(interval+1, col + 2) = val^2;
  X(interval+1, col + 3) = val^3;
  Y(interval+1) = y(interval+1);

  for i = 0:interval-2
    val = x(i+2) - x(i+1);
    col_si = 4*i;

    % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
    row = interval+1 + 3*i + 1;
    X(row, col_si+1) = 1; %ai
    X(row, col_si+2) = val; % bi
    X(row, col_si+3) = val^2; % ci
    X(row, col_si+4) = val^3; % di
    X(row, col_si+5) = -1; % ai+1

    % TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
    row++
    X(row, col_si+2) = 1; % bi
    X(row, col_si+3) = 2*val; % ci
    X(row, col_si+4) = 3*val^2; % di
    X(row, col_si+6) = -1; % bi+1

	  % TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
    row++;
    X(row, col_si+3) = 2; % ci
    X(row, col_si+4) = 6*val; % di
    X(row, col_si+7) = -2; % ci+1
  endfor

	% TODO 6: s0''(x0) = 0
  % inseamna ca 2c0 = 0
  X(n-1, 3) = 2;

	% TODO 7: s_n-1''(x_n) = 0
  % inseamna ca 2cn-1 + 6dn-1 = 0
  val = x(end) - x(end-1);
  X(n, n-1) = 2;
  X(n, n) = 6*val;

	% Solve the system of equations
  coef = X \ Y;
endfunction
