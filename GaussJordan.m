clc; clearvars; close all;

A = input("Enter matrix A: ");
B = input("Enter matrix B: ");
aug = [A B];
n = length(A);

for i=1:n
    [maxValue, maxIndex] = max(abs(aug(i:n, i)));
    maxIndex = maxIndex + i -1;
    if maxIndex~=i
        temp = aug(i,:);
        aug(i,:) = aug(maxIndex, :);
        aug(maxIndex, :) = temp;
    end
    aug(i, :) = aug(i, :)/aug(i, i);
    for j=1:n
        if i~=j
            aug(j, :) = aug(j, :) - aug(i, :)*aug(j,i);
        end
    end
end
fprintf("The solution vector x is: \n");
disp(aug(:, n+1))