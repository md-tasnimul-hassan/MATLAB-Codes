clc; clear; close all;
f  = @(x) sin(cos(1./x));
df = @(x) (1./x.^2).*sin(1./x).*cos(cos(1./x));

point = 1/sqrt(2);
true_val = df(point);
h = 1;
tol = 1e-10;
N = 15;
H = zeros(1,N);
Err = zeros(1,N);
D = zeros(1,N);

for i = 1:N
    % 4th-order central difference
    D(i) = (-f(point+2*h)+8*f(point+h)-8*f(point-h)+f(point-2*h))/(12*h);
    Err(i) = abs(true_val - D(i));
    H(i) = h;
    dD = 0;
    if i > 1
        dD = abs(D(i) - D(i-1));
        if dD < tol || (i > 2 && dD >= abs(D(i-1)-D(i-2)))
            break;
        end
    end
    h = h/10;
end

% Trim unused entries
H = H(1:i);
Err = Err(1:i);
fprintf("Final differentiation value: %0.10f. Actual value: %0.10f", D(i), true_val);

loglog(H, Err,'LineWidth',2);
set(gca, "XDir", "reverse"); % we need this line because by default matlab's x axis will show values from low to high
grid on;
xlabel('Step size h');
ylabel('Error value');
title('O(h^4) Central Difference Step size vs Error');
