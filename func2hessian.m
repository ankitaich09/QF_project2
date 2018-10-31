function h = func2hessian(x)
    [A, b, c] = func2loadcoefficients();
    % A is 500x100
    % b is 500x1
    % c is 100x1
    h = @(x) A' * diag(1./((b - A*x).^2))*A;
end
