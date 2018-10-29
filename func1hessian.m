function H = func1hessian(x)
	% x belongs to Rnxm where each column is a vector 2x1
	% returns an array of matrices with the hessian for each point xi

    [n, m] = size(x);
    H = zeros(n, n*m);

    for i=1:n
        H(i, :) = repmat([zeros(1, i-1), i*2, zeros(1, n - i)], 1, m)
    end
end
