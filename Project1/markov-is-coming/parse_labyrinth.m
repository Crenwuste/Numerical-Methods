function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % TODO: parse_labyrinth implementation
  in = fopen(file_path, 'r');
  if in == -1
    error('Nu s-a putut deschide fișierul %s', file_path);
  end

  dims = fscanf(in, '%d', 2);
  n = dims(1);
  m = dims(2);

  Labyrinth = fscanf(in, '%d', [m, n])';

  fclose(in);

end
