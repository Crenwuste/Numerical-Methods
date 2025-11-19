// Traistaru Dragos-Andrei 313CA

# 1. Markov is coming

# Functions
`parse_labyrinth`
- The function loads labyrinth data from a text file specified by `file_path`. If the file cannot be opened, the program displays an error message and stops. It reads the dimensions m and n, and then the labyrinth of size n x m.

`get_adjacency_matrix`
- The function constructs the connections between the labyrinth nodes in a sparse adjacency matrix `Adj`, based on the values in the labyrinth. It checks if there is a free path upwards, left, downwards, or right. If so, connections are created between the corresponding nodes in the adjacency matrix.

`get_link_matrix`
- This function is similar to `get_adjacency_matrix`, but it calculates the probability of moving in a direction, which is proportional to the total number of free paths in the current cell.

`get_Jacobi_parameters`
- The function extracts from the `Link` matrix the submatrix `G`, which contains only the connections between nodes, without the win and lose nodes. In parallel, the vector `c` stores the column of the win node.

`perform_iterative`
- The function applies the Jacobi iteration algorithm.

`heuristic_greedy`
- This function implements a greedy search algorithm to find a path in a labyrinth, starting from an initial position and following the probabilities associated with each node. The function uses an adjacency matrix to identify available neighbors and chooses the path with the highest probability of success. The algorithm continues adding nodes to the path until it reaches the “WIN” node or no neighbors are available.

`decode_path`
- This function converts a vector of states into a path of coordinates. Each state in the `path` vector represents a position in a linear matrix corresponding to a labyrinth with rows and columns. The function calculates the corresponding coordinates for each state, excluding the “WIN” state from the result.

# 2. Linear Regression

# Functions
`parse_data_set_file`
- The function loads data from a text file specified by `file_path`. If the file cannot be opened, the program displays an error message and stops. It reads the dimensions m and n, and then reads each line of the file sequentially. The first element of the line is an integer and is added to the vector `Y`, while the remaining elements of different data types are stored in the matrix `InitialMatrix` of type Cell.

`prepare_for_regression`
- The function processes `InitialMatrix` so that it contains only numeric data types. It replaces 'yes' with 1 and 'no' with 0. Also, the values 'semi-furnished' are mapped to [1, 0], 'unfurnished' to [0, 1], and 'furnished' to [0, 0].

`linear_regression_cost_function`
- The function first calculates model predictions by multiplying the feature matrix `FeatureMatrix` with the coefficient `Theta` (ignoring Theta0). Then, it calculates the error as the sum of squares of differences between the model predictions and real values, divided by 2 and normalized by the number of training examples.

`parse_csv_file`
- Unlike `parse_data_set_file`, in this function it is not necessary to read the dimensions m and n. Here, the file is traversed line by line until the end, and variables are separated by `,` instead of ` `.

`gradient_descent`
- The function calculates predictions for the training data, determines the errors relative to real values, and then uses these errors to compute the gradient of the cost function.

`normal_equation`
- The conjugate gradient algorithm is applied.

`lasso_regression_cost_function`
- This function is similar to `linear_regression_cost_function` but adds an additional L1 regularization term. This term penalizes the model coefficients, controlling its complexity via the parameter λ.

`ridge_regression_cost_function`
- This function adds a penalty term to the cost function, similar to L1 regularization, but in this case penalizes the squares of the model coefficients. The regularization term is the sum of squares of the values in the `Theta` vector multiplied by the parameter λ.

# 3. MNIST 101

# Functions
`load_dataset`
- The function loads a .m file from the specified path and saves the feature matrix `X` and the target vector `y`, preparing the data for further processing.

`split_dataset`
- The function randomly permutes the rows of the feature matrix `X` and the class vector `y`. After permutation, a specified percentage of examples, according to the `percent` parameter, is added to the training set (`X_train` and `y_train`), and the remaining examples are placed in the test set (`X_test` and `y_test`).

`initialize_weights`
- The function calculates ε using the formula specified in the instructions and uses this ε to populate a matrix with random elements in the interval (-ε, ε).

`cost_function`
- The function extracts `Theta1` and `Theta2` from the `params` vector using the `reshape` function, with corresponding dimensions.
- The forward propagation algorithm is applied. Input data are extended with a bias and propagated through the hidden layer, where a linear transformation is applied followed by a sigmoid activation. The result is again extended with a bias and sent to the output layer, where another sigmoid activation produces the final predictions.
- A vector for the real values is created, and then the error between predictions and real values is calculated. The error is used to adjust network parameters via backpropagation.
- Gradients for each layer are calculated by dividing the sum of accumulated variations by the number of examples. Then regularization is added, updating each layer’s parameters with a penalty term proportional to λ, without affecting the bias.
- The cost function is calculated using logarithms to measure the difference between network predictions and real values. Additionally, a regularization term is added.

`predict_classes`
- The function extracts `Theta1` and `Theta2` matrices from the `weights` vector using `reshape`, and then applies forward propagation to obtain a vector with all predictions for the examples in the test set.
