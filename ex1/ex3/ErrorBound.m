PrimeOmega = @(n) (n ~= 1) * length(factor(n));
f = @(n) (-1)^PrimeOmega(n) / (n^2);

Sn = 0;
e = 10^-2;

for n = 1:1000000
  an = f(n);
  Sn = Sn + an;
  if abs(an / (Sn - an)) < e
    fprintf('%-8d %-.16f %-.16f %-.16f\n', n, Sn, e, abs(Sn - pi^2/15));
    e = e / 10;
  end
end
