clc; clearvars; close all;
f = @(x) x.^5+x+1;
high = 0;
low = -1;
tol = 1e-4;
iter = 0;
maxiter = 999;
target = high - (f(high).*(low-high)/(f(low)-f(high)));
while abs(f(target))>tol && iter<maxiter
    if f(target)*f(high) > 0
        high = target;
    else
        low = target;
    end
    target = high - (f(high).*(low-high)/(f(low)-f(high)));
    iter = iter + 1;
end
fprintf("The root is %0.10f\nNumber of iterations: %f\n", target, iter);