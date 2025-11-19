function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from `mat` that have strictly less then `min_reviews` reviews.

  [rows, ~] = size(mat);
  keep = [];

  for i = 1:rows
    count = 0;
    count = sum(mat(i, :) != 0); % numara cate review-uri are o persoana
    if count >= min_reviews % daca are destule review-uri salvam indexul liniei
      keep = [keep; i];
    endif
  endfor

  % formam matricea finala cu indexii liniilor pe care le pastram
  reduced_mat = mat(keep, :);
endfunction
