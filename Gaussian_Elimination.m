clc; clearvars; close all;
A = input("Enter matrix A: ");
B = input("Enter matrix B: ");
aug = [A B];      
n = length(A);

% looping through columns now. Don't care about the last column
for i = 1:n-1
    % first we fix poivots
    [maxValue, maxIndex] = max(abs(aug(i:n, i)));
    maxIndex = maxIndex + i - 1;
    if maxIndex ~= i
        temp = aug(i,:);
        aug(i,:) = aug(maxIndex, :);
        aug(maxIndex, :) = temp;
    end
    
    % doing elementary row operations now
    for j = i+1:n
        factor = aug(j, i) / aug(i, i);
        aug(j, :) = aug(j, :) - factor * aug(i, :);
    end
end
fprintf('Triangularized Matrix:\n');
disp(aug);

% Back substitution starts
x = zeros(n, 1); 
% Solve for the last variable first
x(n) = aug(n, end) / aug(n, n);
% Solve for the remaining variables moving upwards
for i = n-1:-1:1
    % Sum the already known terms to the right of the diagonal
    sum_known = aug(i, i+1:n) * x(i+1:n);
    % Calculate x_i
    x(i) = (aug(i, end) - sum_known) / aug(i, i);
end

fprintf('Solution [x1; x2; x3]:\n');
disp(x);