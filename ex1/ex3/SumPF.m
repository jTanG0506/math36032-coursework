function sum = SumPF(N)
% SUMPF    Finds an approximation of the sum of reciprocal squares
%          with prime factors by summing the first N terms

sum = 1;
sigma = @(x) length(factor(x));

for k = 2:N
    sum = sum + (-1)^sigma(k) / k^2;
end

end