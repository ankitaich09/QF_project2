function step_size = find_step_size(fn,grad,x,p)

% % fn is the function 
% grad is the gradient function
% x is the current value of x
% p = search direction

% for practice c = 0.1, rho = 0.5, initial step size = 1

initial_step_size = 1;

a = initial_step_size;
c = 0.1;
rho = 0.5;

while fn(x+a.*p) > fn(x) + c*a*grad(x).*p
        a = a*rho;
end

step_size = a;