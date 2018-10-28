function H = analytical_hessian_func(f)
    % this function is just an adapter function to make compatible the
    % argument list to the numerical_gradient_func argument list.
    H = @(ff, gf, x, varargin) f(x);
end

