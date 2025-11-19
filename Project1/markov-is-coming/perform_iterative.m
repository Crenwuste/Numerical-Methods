function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations

	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
  x_prev = x0;
  steps = 0;

  while steps < max_steps
    steps++;
    x = G * x_prev + c;

    err = norm(x - x_prev);

    if err < tol
      break;
    endif

    x_prev = x;
  endwhile

  if steps == 0
    x = x0;
    err = norm(G * x0 + c - x0);
  endif
endfunction
