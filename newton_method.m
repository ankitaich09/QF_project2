function [errors, points] = newton_method(f, g, h, x0, maxiter, E, varargin)
    % f: is a function such that f(x) : Rnx1 -> R
    % g: is the gradient of f, g(x) : Rnx1 -> Rnx1
    % h: is the hessian of f, h(x) : Rnx1 -> Rnx(n*m)
    % x0: is the initial point, belongs to Rnx1
    % maxiter: is the maximum number of iterations
    % E: is the acceptable error between iterations
    % vargarin: can include a point x* (xstar) for a known minimum so the
    % error is computed with that minimum
    % this function returns the error in each iteration and the points found

    if(nargin>6)
        xstar = varargin{1};
    end

    i = 0;
    errors = [];
    points = [x0];

    while true
        i = i + 1;

        %p = h(f, g, x0, 4) \ -g(f, x0, 4);
        % use the Moore-Penrose pseudoinverse of the hessian
        p = pinv( h(f, g, x0, 4)) * -g(f, x0, 4);
        a = backtrack(f, g, p, x0);
        x1 = x0 + a*p;

        if(nargin>6) current_err = norm(f(x1) - f(xstar));
        else         current_err = norm(f(x0) - f(x1));
        end

        errors = [errors; current_err];
        points = [points, x1];

        x0 = x1;
        if((current_err <= E) || (i >= maxiter)); break; end
    end
end
