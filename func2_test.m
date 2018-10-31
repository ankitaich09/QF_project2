f = func2();
%gf = @numerical_gradient_func;
gf = analytical_gradient_func(func2gradient());
hf = @numerical_hessian_func;
hf = analytical_hessian_func(func2hessian());

num_vars = 100;
err = 1.0e-10;
max_iter = 10000;

x0 = zeros(num_vars,1);
%x0 = floor(10000*rand(num_vars,1));
%x0 = repmat(123, num_vars, 1);
%x0 = repmat(1, num_vars, 1);
%known_minimum = zeros(num_vars,1);

%[errors, points] = gradient_descent_method(f, gf, x0, max_iter, err, known_minimum)
%figure
%draw_errors(errors, "log")

%[errors, points] = gradient_descent_method(f, gf, x0, max_iter, err);
%figure
%draw_errors(errors, "log")

[errors, points] = newton_method(f, gf, hf, x0, max_iter, err);
figure
draw_errors(errors)

% Results (error, iterations):
% gdescent with xstar: x0 = 0 -> (1.3450e+04, 10000) | x = 1 -> (9.8249e-11, 517)
% gdescent without xstar: (1.3335e+04, 10000) | x = 1 -> (8.3596e-11, 437)
% newton: x = 100 -> (1.0441e-25, 1) | x = 1 -> (6.1013e-30, 1)
