function SumPF
% SUMPF    Finds an approximation of the sum of reciprocal squares
%          with prime factors

S = 0;
T = pi^2 / 6;
k = 0; d = 1;
PrimeOmega = @(n) (n ~= 1) * length(factor(n));

fprintf('%-8s %-8s %8s\n', 'Terms', 'Value', 'Accuracy');
while (k < 1000000)
  if (round(S - T, d) == round(S + T, d))
    fprintf('%-8d %8f %-8d\n', k, round(S, d), d);
    d = d + 1;
  end
  k = k + 1;
  S = S + (-1)^PrimeOmega(k) / k^2;
  T = T - 1 / k^2;
end
end