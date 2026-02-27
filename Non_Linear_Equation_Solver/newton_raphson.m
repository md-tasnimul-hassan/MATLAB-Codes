clc; clearvars; close all;
% we can't use 0 as initial root guess becuase 0 is the root. we use -0.5
x0 = -0.5;
f = @(x) exp(-x)-1;
df = @(x) -exp(-x);
tol = 1e-8;
dx = -f(x0)/df(x0);
root = x0 + dx;
iter = 1; maxiter = 999;
while(abs(dx) > tol && iter<maxiter)
    dx = -f(root)/df(root);
    root = root + dx;
    iter = iter + 1;
end
fprintf("Approximated root is %f. Total number of iteration is %f.\n", root, iter);