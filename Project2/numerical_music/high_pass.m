function s = high_pass(signal, fs, cutoff_freq)
  s = 0;

  x = fft(signal);
  fft_size = length(x);

  % vectorul de frecventa
  f = (0:(fft_size - 1)) * (fs / fft_size);

  % initializare vector de masca
  vect = zeros(fft_size, 1);
  for i = 1:floor(fft_size/2)
    if f(i) > cutoff_freq
      %completam vectorul in simetrie
      vect(i) = 1;
      vect(fft_size - i + 1) = 1;
    endif
  endfor

  s = x .* vect;

  % transformarea inversa
  s = ifft(s);

  % normalizam
  s = s / max(abs(s));
endfunction
