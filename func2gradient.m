function g = func2gradient(x)
    [A, b, c] = func2loadcoefficients(); 
    % A is 500x100
    % b is 500x1
    % c is 100x1
    g = @(x) c + A'*(1./(b - A*x));
end
