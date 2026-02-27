clc; clearvars; close all;

A = input("Enter matrix A: ");
B = input("Enter matrix B: ");
tol = 1e-5;
n = length(A);
x = ones(n, 1);
err = norm(A*x-B);
iteration = 0;

for i=1:n 
    [maxValue, maxIndex] = max(abs(A(i:n, i)));
    maxIndex = maxIndex + i -1;
    if maxIndex~=i
        tempA = A(i,:);
        A(i,:) = A(maxIndex, :);
        A(maxIndex, :) = tempA;
        tempB = B(i);
        B(i) = B(maxIndex);
        B(maxIndex) = tempB;
    end
end

while(err > tol && iteration < 1000)
    for i=1:n
        term = B(i, 1);
        for j=1:n
            if i~=j
                term = term - A(i,j)*x(j,1);
            end
        end
        x(i, 1) = term/A(i,i);
    end
    err = norm(A*x-B);
    iteration = iteration + 1;
end

fprintf("The solution vector is: \n");
disp(x);
if iteration >= 1000
    fprintf("Didn't converge.\n");
end
fprintf("%f iteration happened. Value of error is %f.\n", iteration, err);