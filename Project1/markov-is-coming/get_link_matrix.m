function [Link] = get_link_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings

  % Link -> the link matrix associated to the given labyrinth

  % TODO: get_link_matrix implementation
  [n, m] = size(Labyrinth);
  total_nodes = n * m;
  Link = sparse(total_nodes + 2, total_nodes + 2);

  for i = 1:n
    for j = 1:m
      val = Labyrinth(i, j);
      node = (i - 1) * m + j;
      ct = 0;

      if bitand(val, 8) == 0
        ct++;
      endif
      if bitand(val, 4) == 0
        ct++
      endif
      if bitand(val, 2) == 0
        ct++
      endif
      if bitand(val, 1) == 0
        ct++
      endif

      if bitand(val, 8) == 0
        if i == 1
          Link(node, total_nodes + 1) = 1 / ct;
        else
          neighbor = (i - 2) * m + j;
          Link(node, neighbor) = 1 / ct;
        endif
      endif

      if bitand(val, 4) == 0
        if i == n
          Link(node, total_nodes + 1) = 1 / ct;
        else
          neighbor = i * m + j;
          Link(node, neighbor) = 1 / ct;
        endif
      endif

      if bitand(val, 2) == 0
        if j == m
          Link(node, total_nodes + 2) = 1 / ct;
        else
          neighbor = (i - 1) * m + j + 1;
          Link(node, neighbor) = 1 / ct;
        endif
      endif

      if bitand(val, 1) == 0
        if j == 1
          Link(node, total_nodes + 2) = 1 / ct;
        else
          neighbor = (i - 1) * m + j - 1;
          Link(node, neighbor) = 1 / ct;
        endif
      endif

    endfor
  endfor
  Link(total_nodes + 1, total_nodes + 1) = 1;
  Link(total_nodes + 2, total_nodes + 2) = 1;
endfunction
