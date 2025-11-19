function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best num_recoms recommandations similar with 'liked_theme'.
  mat = read_mat(path);

  reduced_mat = preprocess(mat, min_reviews);

  [U, S, V] = svds(reduced_mat, num_features);

  [rows, ~] = size(V);

  % extragem vectorul temei preferate din matricea V
  liked_vect = V(liked_theme, :);

  % calculam similaritatea cosinus intre tema preferata si toate celelalte teme
  similarity = zeros(1, rows);
  for i = 1:rows
    if i != liked_theme
      similarity(i) = cosine_similarity(liked_vect', V(i, :)');
    endif
  endfor

  % sortam temele dupa similaritate si returnam primele num_recoms
  [~, indices] = sort(similarity, 'descend');
  recoms = indices(1:num_recoms);
endfunction
