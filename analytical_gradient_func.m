function g = analytical_gradient_func(f)
    % this function is just an adapter function to make compatible the
    % argument list to the numerical_gradient_func argument list.
    g = @(ff, x, varargin) f(x);
end
