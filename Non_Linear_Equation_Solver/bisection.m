clc; clearvars; close all;
f = @(x) x.^5+x+1;
xlow = -1;
xhigh = 0;
xmid = (xlow+xhigh)/2;
ylow = f(xlow);
ymid = f(xmid);
tol = 1e-4;
iter = 0;
maxiter = 999;
while((xhigh-xlow)/2 > tol && iter<maxiter)
    if(ylow*ymid > 0)
        xlow = xmid;
        ylow = ymid;
    else
        xhigh = xmid;
    end
    xmid = (xlow+xhigh)/2;
    ymid = f(xmid);
    iter = iter + 1;
end

fprintf("Approximate root: %f. Total number of iteration %f.\n", xmid, iter);
