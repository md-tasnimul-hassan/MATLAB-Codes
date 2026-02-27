clc; clearvars; close all;
f = @(x) 3*x+sin(x)-exp(x);
previous = 0; 
updated = 0.1;
tol = 1e-7;
iter = 0;
maxiter = 999;
while abs(f(updated)) > tol && iter<maxiter
    new = updated - f(updated) * (updated - previous) / (f(updated) - f(previous));
    previous = updated;
    updated = new;
    iter = iter + 1;
end
fprintf("Root: %.10f\nIterations: %d\n", updated, iter);
