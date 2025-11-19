## Traistaru Dragos-Andrei 313CA ##

# 1. Numerical Music

# Functions
`stereo_to_mono`
- Converts a stereo signal to mono by calculating the arithmetic mean of the channels and normalizing the result.

`spectrogram`
- Computes the signal's spectrogram using the Fourier transform on windows.
- Multiplies each window by a Hann window before applying the FFT.
- Returns the amplitude matrix, frequency vector, and time vector.

`oscillator`
- Generates a sinusoidal signal with specified frequency and duration.
- Calculates the number of samples for each ADSR phase, generates linear transitions and a constant section for sustain, and finally applies this envelope to the signal by multiplication.

`high_pass`
- Implements the filter using the Fourier transform.
- Generates a frequency mask that removes components below the given frequency.
- Applies the inverse Fourier transform and normalizes the result.

`apply_reverb`
- Converts the impulse to mono, applies convolution, and normalizes the result.

# 2. Robotzii

# Functions
`parse_data`
- Reads input data from a file.

`spline_c2`
- Constructs the linear system needed for cubic spline interpolation, generating a coefficient matrix and a right-hand side vector that allow the unique determination of the coefficients.

`P_spline`
- For each x value to be interpolated, identifies the corresponding segment and calculates the cubic polynomial value using the already determined coefficients.

`vandermonde`
- Constructs the Vandermonde matrix using powers of the given values and solves the system of equations to obtain the interpolation polynomial coefficients.

`P_vandermonde`
- Constructs the power matrix for the interpolation points and calculates the polynomial values using matrix multiplication with the determined coefficients.

# 3. Recommendations

# Functions
`cosine_similarity`
- Computes the cosine similarity between two column vectors.

`read_mat`
- Reads the rating matrix from a CSV file.

`preprocess`
- Preprocesses the rating matrix by removing users with too few reviews.

`recommendations`
- After reading and preprocessing the matrix, applies the SVD algorithm. Then, the theme liked by the clients is compared with the others using cosine similarity to measure how close they are. The most similar themes are sorted and the best ones are selected as recommendations.
