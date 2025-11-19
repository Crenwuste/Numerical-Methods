function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation
  n = length(path);
  n--;
  decoded_path = zeros(n, 2);
  for i = 1:n
    for j = 1:2
      if j == 1
        decoded_path(i, j) = ceil(path(i) / cols);
      else
        decoded_path(i, j) = mod(path(i) - 1,  cols) + 1;
      endif
    endfor
  endfor
end
