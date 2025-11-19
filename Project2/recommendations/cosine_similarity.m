function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.

  % normalizam vectorii
  A = A / norm(A, 2);
  B = B / norm(B, 2);

  % aplicam formula
  similarity = A' * B;
endfunction
