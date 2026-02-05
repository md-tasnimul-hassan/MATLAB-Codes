clc; clearvars; close all;

f = @(x) exp(x);
i = 1:10;
h = 10.^(-i);
x = 1;
dif_real = exp(1);

dif = (f(x+h)-f(x-h))./(2*h);

error = abs(dif_real-dif);

loglog(h, error, LineWidth=2);
title("Log-Log graph of step size(h) vs error");
xlabel("Step size (h)");
ylabel("Error value");