clc; clearvars; close all;
f = @(x) x.*exp(-2*x.^2); 
a = 0; b = 2; e = 0.001;
real_value = 0.249916;
h = b - a;
Sum = (f(a) + f(b)) / 2;
updated_value = h * Sum;
i = 1;
while true
    x = a + h/2;           
    for j = 1:i            
        Sum = Sum + f(x);
        x = x + h;
    end
    i = 2*i;               
    h = h/2;               
    value = updated_value;               
    updated_value = h * Sum;     
    if abs(updated_value - value) <= e * abs(updated_value)
        break;
    end
end
fprintf("Adaptive integration result: %f. Error: %f\n", updated_value, abs(updated_value-real_value));