function g = num_gradient_func(f, x, order, varargin)
    % f is a function such that f(x) : Rnx1 -> R
    % x is an array of vectors that belongs to Rnxm, x = [x1, x2, .., xn] where xi is a vector nx1
    % order is the order of the Taylor expansion for the central difference formula
    % vargarin can include a scalar value 'h'
    % this function returns the 'numerical gradian' for each point xin the same dimension of x
    
    if(nargin < 4) h = sqrt(eps) * (1 + norm(x(:), inf));
    else h = varargin{1}; end
    
    [n, m] = size(x); % m points x1, x2, ..., xm
    g = zeros(n, m);
    
    for i = 1:n
        ei = e(x, i);
        switch order
        case 1
            g(i,:) = (1/h) * (f(x + h * ei) - f(x));
        case 2
            g(i, :) = (1/(2*h)) * (f(x + h * ei) - f(x - h * ei));
        case 4
            g(i, :) = (1/(12*h)) * (-f(x + 2 * h * ei) + 8 * f(x + h * ei) - 8 * f(x - h * ei) + f(x - 2* h * ei));
        otherwise
            error('Error: gradient order %d not implemented.', order)
        end
    end
end
