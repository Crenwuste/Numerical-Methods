function s = apply_reverb(signal, impulse_response)
  s = 0;

  impulse_response = stereo_to_mono(impulse_response);

  % calculam convolutia
  s = fftconv(signal, impulse_response);

  % normalizam semnalul
  s = s / max(abs(s));
endfunction
