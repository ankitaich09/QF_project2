function newx = e(x, i)
	% x is an array of vectors that belongs to Rnxm, x = [x1, x2, .., xn] where xi is a vector nx1
	% i is the index to set 1 in the i component of each vector
	% returns an array or vectors of zeros with the component i with equals to 1
    [n, m] = size(x);
    if(i > n || i < 1)
        error('Error: invalid number of row %d for matrix X of n = %d by m = %d.', i, n, m);
    end
    newx = [zeros(i-1, m); ones(1, m); zeros(n-i, m)];
end
