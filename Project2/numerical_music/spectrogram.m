function [S f t] = spectrogram(signal, fs, window_size)
	S = 0;
  f = 0;
  t = 0;

  [n, ~] = size(signal);
  dim = floor(n / window_size); % numar de ferestre complete

  % initializare matrice spectrograma
  S = zeros(window_size, dim);
  fft_size = 2 * window_size;

  % fereastra Hann
  w = hanning(window_size);

  for i = 1:dim
    start = (i-1) * window_size + 1;
    finish = start + window_size - 1;

    window = signal(start:finish) .* w;

    F = fft(window, fft_size);

    % pastram prima jumatate
    S(:, i) = abs(F(1:fft_size/2));
  endfor

  % vectorul de frecventa
  f = (0:(fft_size/2 - 1))' * fs / fft_size;

  % vectorul de timp
  t = ((0:dim-1))' * window_size / fs;
endfunction
