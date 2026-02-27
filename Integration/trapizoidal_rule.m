clc; clearvars; close all;
f = @(x) 1/(1+x.^2);
a = -1; b = 1;
N = 12;
h = (b-a)/N;
sum = 0;
for i=1:N-1
    sum = sum + f(a + i*h);
end
integral = (h/2)*(f(a) + f(b) + 2.*sum);
fprintf("Integration result is: %f\n", integral);