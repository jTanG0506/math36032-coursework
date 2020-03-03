function S = SumPFAlt(N)
% SUMPF    Finds an approximation of the sum of reciprocal squares
%          with prime factors by summing the first N terms

S = 1;
omega = @(x) length(factor(x));

for k = 2:N
    S = S + (-1)^omega(k) / k^2;
end
end
