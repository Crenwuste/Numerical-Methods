function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed

  % FeatureMatrix -> the matrix with all training examples

  % TODO: prepare_for_regression implementation
  [n, m] = size(InitialMatrix);
  FeatureMatrix = [];
  for i = 1:n
    new_line = [];
    for j = 1:m
        if strcmp(InitialMatrix{i, j}, "yes")
          new_line(end+1) = 1;
        elseif strcmp(InitialMatrix{i, j}, "no")
          new_line(end+1) = 0;
        elseif strcmp(InitialMatrix{i, j}, "semi-furnished")
          new_line(end+1) = 1;
          new_line(end+1) = 0;
        elseif strcmp(InitialMatrix{i, j}, "unfurnished")
          new_line(end+1) = 0;
          new_line(end+1) = 1;
        elseif strcmp(InitialMatrix{i, j}, "furnished")
          new_line(end+1) = 0;
          new_line(end+1) = 0;
        else
          new_line(end+1) = str2double(InitialMatrix{i, j});
        endif

    endfor
    FeatureMatrix = [FeatureMatrix; new_line];
  endfor
endfunction
