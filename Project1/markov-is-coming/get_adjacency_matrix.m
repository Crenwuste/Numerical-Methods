function [Adj] = get_adjacency_matrix (Labyrinth)
  % Labyrinth -> the matrix of all encodings

  % Adj -> the adjacency matrix associated to the given labyrinth

  % TODO: get_adjacency_matrix implementation
  [n, m] = size(Labyrinth);
  total_nodes = n * m;
  Adj = sparse(total_nodes + 2, total_nodes + 2);

  for i = 1:n
    for j = 1:m
      val = Labyrinth(i, j);
      node = (i - 1) * m + j;

      if bitand(val, 8) == 0
        if i == 1
          Adj(node, total_nodes + 1) = 1;
        else
          neighbor = (i - 2) * m + j;
          Adj(node, neighbor) = 1;
          Adj(neighbor, node) = 1;
        endif
      endif

      if bitand(val, 4) == 0
        if i == n
          Adj(node, total_nodes + 1) = 1;
        else
          neighbor = i * m + j;
          Adj(node, neighbor) = 1;
          Adj(neighbor, node) = 1;
        endif
      endif

      if bitand(val, 2) == 0
        if j == m
          Adj(node, total_nodes + 2) = 1;
        else
          neighbor = (i - 1) * m + j + 1;
          Adj(node, neighbor) = 1;
          Adj(neighbor, node) = 1;
        endif
      endif

      if bitand(val, 1) == 0
        if j == 1
          Adj(node, total_nodes + 2) = 1;
        else
          neighbor = (i - 1) * m + j - 1;
          Adj(node, neighbor) = 1;
          Adj(neighbor, node) = 1;
        endif
      endif

    endfor
  endfor
  Adj(total_nodes + 1, total_nodes + 1) = 1;
  Adj(total_nodes + 2, total_nodes + 2) = 1;
endfunction
