function a = backtrack(f, g, p, x, varargin)
    % f is a function such that f(x) : Rnx1 -> R
    % g is the gradient of f, g(x) : Rnx1 -> Rnx1
    % p is a descent direction vector that belongs to Rnx1 -> Rnx1
    % x is an array of vectors that belongs to Rnxm, x = [x1, x2, .., xn] where xi is a vector nx1
    % returns a that is the step size
    c = 0.1;
    rho = 0.5;
    
    if(nargin<5)
        a = 1;
    else
        a = varargin{1}; 
    end

    while f(x + a*p) > f(x) + c*a*p'*g(f, x, 4)
        a = rho*a;
    end
end
