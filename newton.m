function x = newton(func,grad,hessian,start_pt,stop_value,step_count)

i = 1;
while i <= step_count
    if start_pt(i+1) - start_pt(i) <= stop_value
        x = start_pt;
        break;
    else
        p = hessian(start_pt)\(-grad(start_pt));
        step_size = find_step_size(func,grad,start_pt,p);
        start_pt = start_pt + step_size*p;
    end
end
