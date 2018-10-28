f = @func3;
gf = @numerical_gradient_func;
gf = analytical_gradient_func(@func3gradient);
hf = @numerical_hessian_func;
hf = analytical_hessian_func(@func3hessian);

[x, y] = meshgrid(-2:0.1:2);
% all points arranged as X = [x1, ..., xn] from the meshgrid
X = [x(:)'; y(:)'];
fig1 = figure
% makes z a grid of values with size of x
z = reshape(func3(X), size(x));
surf(x, y, z);
pxy = gf(f, X, 4);
figure
% contour only near zero
contour(x, y, z, 0:.01:2);
hold on

px = reshape(pxy(1,:), size(x));
py = reshape(pxy(2,:), size(x));
quiver(x, y, px, py);
hold off
hold on

% with [0; 0] it takes all the iteration
% with [1; 0] it rapidly goes to the minimum but the function is too much 
% plane around the global minimum that it cannot reach the minimum
% when the starting point is further from the minimum it seems to be better
known_minimum = [1; 1];

%[errors, points] = gradient_descent_method(f, gf, [-2; -2], 10000, 0.0000000001, known_minimum)
[errors, points] = newton_method(f, gf, hf, [-2; -2], 10000, 0.0000000001, known_minimum)

draw_trace(points);
figure(fig1)
hold on
draw3_trace(points, f);
figure
draw_errors(errors, "log")
