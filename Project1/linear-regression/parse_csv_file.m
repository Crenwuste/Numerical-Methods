function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file

  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  in = fopen(file_path, 'r');
  if in == -1
    error('Nu s-a putut deschide fișierul %s', file_path);
  endif

  fgetl(in);

  Y = [];
  InitialMatrix = {};
  line_index = 1;

  while ~feof(in)
    line = fgetl(in);
    tokens = strsplit(line, ',');
    Y(end+1, 1) = str2double(tokens{1});
    InitialMatrix(line_index, :) = tokens(2:end);
    line_index++;
  endwhile

  fclose(in);
endfunction


