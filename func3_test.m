f3 = @(x) 100 * (x(2,:) - x(1,:).^2).^2 + (1 - x(1,:)).^2;

f3dx1 = @(x) 2 * x(1,:) - 400 * x(1,:) * (x(2,:) - x(1,:).^2) - 2;
f3dx2 = @(x) 200 * x(2,:) - 200 * x(1,:).^2;

gf3 = @(x) [f3dx1(x); f3dx2(x)];

[x, y] = meshgrid(-2:0.1:2);
% all points arranged as X = [x1, ..., xn] from the meshgrid
X = [x(:)'; y(:)'];
fig1 = figure
% makes z a grid of values with size of x
z = reshape(f3(X), size(x));
surf(x, y, z);
pxy = num_gradient_func(f3, X,1);
figure
% contour only near zero
contour(x, y, z, 0:.01:2);
hold on

px = reshape(pxy(1,:),size(x));
py = reshape(pxy(2,:),size(x));
quiver(x, y, px, py);
hold off
hold on

% with [0; 0] it takes all the iteration
% with [1; 0] it rapidly goes to the minimum but the function is too much 
% plane around the global minimum that it cannot reach the minimum
% when the starting point is further from the minimum it seems to be better
known_minimum = [1; 1];
% analytical
% [errors, points] = gradient_descent(f3, gf3, [0; 0], 10000, 0.0000000001, known_minimum)
% numerical
[errors, points] = gradient_descent_method(f3, gf3, [-2; -2], 10000, 0.0000000001, known_minimum)
draw_trace(points);
figure(fig1)
hold on
draw3_trace(points, f3);
figure
draw_errors(errors, "log")
