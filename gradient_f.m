function y = gradient_f(x)

i = 1;
ele1 = 2*(((200*x(i)^3)-(200*x(i)*x(i+1))+x(i)-(i)));
ele2 = 200*(x(i+1)-x(i)^(i+1));
y = [ele1;ele2];