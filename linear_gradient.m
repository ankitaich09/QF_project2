function [l,g,h] = linear_gradient(x1,x2)


choice = input('Choose 1 for y = x1^2 + 10.x2^2 2 for y = exp(x1+3x2-0.1)+exp(x1-3x2-0.1)+exp(-x1-0.1)---');
if(choice == 1)
    l = x1^2 + 10*(x2^2);
    g = [2*x1;20*x2];
    h = [2 0;0 20];
else
    l = exp(x1+3*x2-0.1)+exp(x1-3*x2-0.1)+exp(-x1-0.1);
    g = [exp(x1+3*x2-0.1)+exp(x1-3*x2-0.1)+exp(-x1-0.1);3*(exp(x1+3*x2-0.1))-3*(exp(x1-3*x2-0.1))];
    h = [exp(x1+3*x2-0.1)+exp(x1-3*x2-0.1)+exp(-x1-0.1) 3*(exp(x1+3*x2-0.1))-3*(exp(x1-3*x2-0.1));3*(exp(x1+3*x2-0.1))-3*(exp(x1-3*x2-0.1)) (9*exp(x1+3*x2-0.1)+9*exp(x1-3*x2-0.1))];
end

