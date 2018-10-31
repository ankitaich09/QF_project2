max_iter = 10000;
err = 1.0e-8;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
fquadratic = @(x) x(1,:).^2 + 10 * x(2,:).^2;

d1x1f = @(x) 2 * x(1,:);
d1x2f = @(x) 20 * x(2,:);
g_fquadratic = @(x) [d1x1f(x); d1x2f(x)];
h_fquadratic = @(x) repmat([2 0; 0 20],1,size(x,2));

x0 = [1,2,3; 2,3,4];

analytical = g_fquadratic(x0)
numerical  = numerical_gradient_func(fquadratic, x0, 1)

f = fquadratic;
x0 = [50;50];
g = analytical_gradient_func(g_fquadratic);
h = analytical_hessian_func(h_fquadratic);

[x, y] = meshgrid(-50:50);
% all points arranged as X = [x1, ..., xn] from the meshgrid
X = [x(:)'; y(:)'];

fig1 = figure
% makes z a grid of values with size of x
z = reshape(f(X), size(x));
surf(x, y, z);

pxy = g(f, X, 4);
figure
% contour only near zero
contour(x, y, z, 0:500:10000);
hold on
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fexponential = @(x) exp(x(1,:)+3*x(2,:)-0.1) + exp(x(1,:)-3*x(2,:)-0.1) + exp(-x(1,:)-0.1);

d1x1fexp = @(x) exp(x(1,:)+3*x(2,:)-0.1) + exp(x(1,:)-3*x(2,:)-0.1) - exp(-x(1,:)-0.1);
d1x2fexp = @(x) 3*exp(x(1,:)+3*x(2,:)-0.1) - 3*exp(x(1,:)-3*x(2,:)-0.1);
g_fexponential = @(x) [d1x1fexp(x); d1x2fexp(x)];

d2x1x1fexp = @(x) exp(x(1,:)+3*x(2,:)-0.1) + exp(x(1,:)-3*x(2,:)-0.1) + exp(-x(1,:)-0.1);
d2x2x1fexp = @(x) 3*exp(x(1,:)+3*x(2,:)-0.1) - 3*exp(x(1,:)-3*x(2,:)-0.1);
d2x1x2fexp = @(x) 3*exp(x(1,:)+3*x(2,:)-0.1) - 3*exp(x(1,:)-3*x(2,:)-0.1);
d2x2x2fexp = @(x) 9*exp(x(1,:)+3*x(2,:)-0.1) + 9*exp(x(1,:)-3*x(2,:)-0.1);

%h_exponential = @(x) [d2x1x1fexp(x),  d2x2x1fexp(x); d2x2x1fexp(x), d2x2x2fexp(x)];
h_fexponential = @(x) [d2x1x1fexp(x),  d2x1x2fexp(x); d2x2x1fexp(x), d2x2x2fexp(x)];

f = fexponential;
x0 = [2;1];
g = analytical_gradient_func(g_fexponential);
h = analytical_hessian_func(h_fexponential);

[x, y] = meshgrid(-2:0.1:2);
% all points arranged as X = [x1, ..., xn] from the meshgrid
X = [x(:)'; y(:)'];

fig1 = figure
% makes z a grid of values with size of x
z = reshape(f(X), size(x));
surf(x, y, z);

pxy = g(f, X, 4);
figure
% contour only near zero
contour(x, y, z, 0:.5:20);
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

px = reshape(pxy(1,:), size(x));
py = reshape(pxy(2,:), size(x));
quiver(x, y, px, py);


[errors_gd, points_gd] = gradient_descent_method(f, g, x0, max_iter, err);
[errors_nw, points_nw] = newton_method(f, g, h, x0, max_iter, err);

hold on
draw_trace(points_gd);
hold on
draw_trace(points_nw);

figure(fig1)
hold on
draw3_trace(points_gd, f);
hold on
draw3_trace(points_nw, f);

figure
draw_errors(errors_gd, "log")
hold on
draw_errors(errors_nw, "log")

