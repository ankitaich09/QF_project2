function draw_errors(errors, varargin)
    % errors is a vector Rnx1 of error values
    % varargin can be the scale of y axis
    scale = "linear";
    if(nargin>1)
        scale = varargin{1};
    end
    iterations = length(errors);
    
    if(scale == "log")
        semilogy(1:iterations, errors);
    else
        plot(1:iterations, errors);
    end
    title(sprintf("Error vs. Iteration\n(reached err %e in %d its.)",errors(iterations), iterations));
    min_error = min(errors)
    last_error_reached = errors(iterations)
end
