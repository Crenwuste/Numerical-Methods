function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

  % TODO: heuristic_greedy implementation
  n = length(probabilities);
  visited = false(1, n);
  path = start_position;
  visited(start_position) = true;
  win = find(probabilities == 1);

  while !isempty(path)
    pos = path(end);

    if pos == win
      return;
    endif

    neighbors = find(Adj(pos, :) & !visited);

    if isempty(neighbors)
      path(end) = [];
    else
      [~, idx] = max(probabilities(neighbors));
      next = neighbors(idx);

      visited(next) = true;
      path(end+1) = next;
    endif
  endwhile
endfunction
