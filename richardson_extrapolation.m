clc; clear; close all;
f = @(x) sin(x.^3 - 7*x.^2 + 6*x + 8);
point = (1 - sqrt(5))/2;

delta = 1e-13;     % absolute error tolerance
toler = 1e-13;     % relative error tolerance

err = 1;
relerr = 1;
h = 1;
j = 1;
D = zeros(12,12);
H = zeros(1, 12);
Err = zeros(1, 12);

D(1,1) = (f(point + h) - f(point - h)) / (2*h);

% Richardson loop
while relerr > toler && err > delta && j < 12
    h = h/2;
    D(j+1,1) = (f(point + h) - f(point - h)) / (2*h);

    for k = 1:j
        D(j+1,k+1) = D(j+1,k) + (D(j+1,k) - D(j,k)) / (4^k - 1);
    end

    err = abs(D(j+1,j+1) - D(j,j));
    relerr = (2*err) / (abs(D(j+1,j+1)) + abs(D(j,j)) + eps);
    H(j) = h;
    Err(j) = err;
    j = j + 1;
end

fprintf('Approximate derivative = %.13f\n', D(j-1,j-1));
fprintf('Absolute error = %.2e\n', err);
fprintf('Relative error = %.2e\n', relerr);
loglog(H, Err, "r", LineWidth=2);
set(gca, "XDir", "reverse");
title("Richardson's Extrapolation step size (h) vs error value");
xlabel("Step Size (h)");
ylabel("Error Value");