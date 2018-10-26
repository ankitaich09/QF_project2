function grad = numerical_gradient(fn,x,order)
%x is a vector of integer values
%h is the step size
h = sqrt(eps)*(1+norm(x(:),inf));
f0 = fn(x);
if order == 1
    f2 = zeros(size(x));
    for i = 1:1:length(x)
        x2 = x;
        x2(i) = x2(i) + h;
        f2(i) = fn(x2);
    end
    grad = 1/h * (f2-f0);
elseif order == 2
    f2 = zeros(size(x));
    f3 = zeros(size(x));
    for i = 1:1:length(x)
        x2 = x;
        x2(i) = x2(i) + h;
        f2(i) = fn(x2);
        x3 = x;
        x3(i) = x3(i) - h;
        f3(i) = fn(x3);
    end
    grad = (1/h/2)*(f2-f3);
end