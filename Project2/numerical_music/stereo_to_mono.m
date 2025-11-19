function mono = stereo_to_mono(stereo)
  mono = stereo;

  mono = mean(stereo, 2); % Media aritmetica a elementelor pe linie

  % Normalize
  mono = mono / max(abs(mono));
endfunction
