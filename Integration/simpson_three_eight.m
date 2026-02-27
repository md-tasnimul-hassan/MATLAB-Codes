clc; clearvars; close all;
f = @(x) 1/(1+x.^2);
a = -1; b = 1;
N = 12;
h = (b-a)/N;
sum = 0;
for i=1:N-1
    if mod(i,3) == 0
        sum = sum + 2*f(a+h.*i);
    else
        sum = sum + 3*f(a+h.*i);
    end
end
result = (3*h/8)*(f(a) + f(b) + sum);
fprintf("Integration value: %f\n", result);
