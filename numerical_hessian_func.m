function H = numerical_hessian_func(f, gf, x, order, varargin)
    % f is a function such that f(x) : Rnx1 -> R
    % gf is the gradian function of f function such that gf(x) : Rnx1 -> Rnx1
    % x is an array of vectors that belongs to Rnxm, x = [x1, x2, .., xn] where xi is a vector nx1
    % order is the order of the Taylor expansion for the central difference formula
    % vargarin can include a scalar value 'h'
    % this function returns the 'numerical hessian' for each point x
    if(nargin<5)
        h = sqrt(eps) * (1 + norm(x(:), inf));
    else
        h = varargin{1};
    end

    [n, m] = size(x);
    H = zeros(n, n*m);

    for i = 1:n
        ei = e(x, i);
        H(:, i:n:n*m) = (1/h) * (gf(f, x + h * ei, order) - gf(f, x, order));
    end
end
