f = @func1;
gf = @numerical_gradient_func;
gf = analytical_gradient_func(@func1gradient);
hf = @numerical_hessian_func;
hf = analytical_hessian_func(@func1hessian);

num_vars = 100;
err = 1.0e-10;
max_iter = 10000;

x0 = ones(num_vars,1);
% x0 = floor(100*rand(num_vars,1));
%x0 = repmat(100, num_vars, 1);
known_minimum = zeros(num_vars,1);

[errors, points] = gradient_descent_method(f, gf, x0, max_iter, err, known_minimum)
figure
draw_errors(errors, "log")

[errors, points] = gradient_descent_method(f, gf, x0, max_iter, err)
figure
draw_errors(errors, "log")

% Newton method works ok up to 25 variables, then it is not working properly because of:
% Warning: Matrix is singular, close to singular or badly scaled. Results
% may be inaccurate. RCOND = NaN.
% > In newton_method (line 23)
% This only happens when using the numerial gradient without the Moore-Penrose 
% pseudoinverse of the hessian

[errors, points] = newton_method(f, gf, hf, x0, max_iter, err, known_minimum)
figure
draw_errors(errors)

% Results (error, iterations):
% x = 100 -> gdescent with xstar: x = 100 -> (9.8170e-11, 723) | x = 1 -> (9.8249e-11, 517)
% gdescent without xstar: x = 100 -> (9.7558e-11, 634) | x = 1 -> (8.3596e-11, 437)
% newton: x = 100 -> (1.0441e-25, 1) | x = 1 -> (6.1013e-30, 1)
