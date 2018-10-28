f = @func1;
gf = @numerical_gradient_func;
%gf = analytical_gradient_func(@func1gradient);
hf = @numerical_hessian_func;
%hf = analytical_hessian_func(@func1hessian);

x0 = ones(100,1);
%x0 = rand(1000,1);
%x0 = floor(10*rand(100,1));
known_minimum = zeros(100,1);


[errors, points] = gradient_descent_method(f, gf, x0, 10000, 0.0000000001, known_minimum)
figure
draw_errors(errors, "log")

[errors, points] = gradient_descent_method(f, gf, x0, 10000, 0.0000000001)
figure
draw_errors(errors, "log")

% Newton method is not working properly because of 
% Warning: Matrix is singular, close to singular or badly scaled. Results
% may be inaccurate. RCOND = NaN.
% > In newton_method (line 23)
%{
[errors, points] = newton_method(f, gf, hf, x0, 10, 0.0000000001)
figure
draw_errors(errors, "linear")
%}
