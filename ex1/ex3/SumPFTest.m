PrimeOmega = @(n) (n ~= 1) * length(factor(n));
f = @(n) (-1)^PrimeOmega(n) / (n^2);
g = @(n) n^(-2);

x = 1:255724;
an = arrayfun(f, x);
sn = cumsum(an);

bn = arrayfun(g, x);
tn = cumsum(bn);

figure
plot(x(5000:end), sn(5000:end), 'b')
plot(y(5000:end), tn(5000:end), 'r')
yline(pi^2/15, '-', 'pi^2 / 15')
xlabel('n')
title('Plots of s(n) (partial sums)')