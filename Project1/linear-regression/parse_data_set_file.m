function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed

  % TODO: parse_data_set_file implementation
  in = fopen(file_path, 'r');
  if in == -1
    error('Nu s-a putut deschide fișierul %s', file_path);
  endif

  line = fgetl(in);
  dim = str2num(line);
  m = dim(1);
  n = dim(2);

  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);

  for i = 1:m
    line = fgetl(in);
    tokens = strsplit(strtrim(line));

    Y(i) = str2double(tokens{1});

    for j=1:n
      InitialMatrix{i, j} = tokens{j + 1};
    endfor
  endfor

  fclose(in);

endfunction
