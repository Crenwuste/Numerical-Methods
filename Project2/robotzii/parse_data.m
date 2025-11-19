function [x, y] = parse_data(filename)
  % file input format:
  % n
  % x0 x1 ... xn
  % y0 y1 ... yn

  % TODO 1: Open the file for reading
  in = fopen(filename, "r");
  if in == -1
    error("Eroare deschidere fisier");
  endif
  % TODO 2: Read n, x, y from the file
  n = fscanf(in, "%d", 1);
  x = fscanf(in, "%d", n + 1);
  y = fscanf(in, "%d", n + 1);
  % TODO 3: Close the file
  fclose(in);
endfunction
