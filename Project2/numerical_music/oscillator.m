function x = oscillator(freq, fs, dur, A, D, S, R)
  x = 0;

  t = (0 : 1/fs : dur)';
  t = t(1:end-1);
  total_samples = length(t);

  % cream semnalul sinusoidal
  signal = sin(2 * pi * freq * t);

  A_samples = floor(A * fs);
  D_samples = floor(D * fs);
  R_samples = floor(R * fs);
  S_samples = total_samples - (A_samples + D_samples + R_samples);

  A_env = linspace(0, 1, A_samples)';
  D_env = linspace(1, S, D_samples)';
  S_env = S * ones(S_samples, 1);
  R_env = linspace(S, 0, R_samples)';

  envelope = [A_env; D_env; S_env; R_env];
  x = signal .* envelope;
endfunction
