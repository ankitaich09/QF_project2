function f = func1(x)
	% x belongs to R100xm where each column is a vector 100x1
    f = 0;
    for i=1:100
       f = f + i * x(i,:).^2;
    end
end
