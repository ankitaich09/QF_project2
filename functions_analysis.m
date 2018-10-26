% Analysis of function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f3 = @(x1, x2) 100*(x2 - x1.^2).^2 + (1 - x2).^2;

f3dx1 = @(x1, x2) 2 * x1 - 400 * x1 * (x2 - x1.^2) - 2;
f3dx2 = @(x1, x2) 200 * x2 - 200 * x1.^2;

[x, y] = meshgrid(-1:.05:1);

figure
surf(x, y, f3(x, y));
grid on

figure
grid on
contour(x, y, f3(x,y))
