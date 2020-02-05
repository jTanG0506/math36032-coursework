function [p, q] = RatAppCat(N)
% RATAPPCATBF    Returns the best approximation p / q of the Catalan's 
%                constant, among all pairs of (p, q) such that p + q <= N.

G = 0.915965594177219;

p = 1; q = 1;
minDelta = abs(G - p / q);

for j = 1 : N
  i0 = floor(G * j);
  for i = i0 : j
    delta = abs(i / j - G);
    if (delta < minDelta)
      minDelta = delta;
      p = i;
      q = j;
    end
  end
end

end