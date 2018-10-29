function g = func1gradient(x)
	% x belongs to Rnxm where each column is a vector nx1
    % returns the gradient of the same dimension of its input

    [n, m] = size(x);

    g = zeros(size(x));
    for i=1:n
        g(i,:) = i*2*x(i,:);
    end
end
