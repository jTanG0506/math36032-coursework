function [p, q] = RatAppCatAlt(N)
% RATAPPCATALT    Returns the best approximation p / q of the Catalan's 
%                 constant, among all pairs of (p, q) such that p + q <= N.

G = 0.577215664901533;
p = 1; q = 1;
minDelta = abs(G - p / q);

for q0 = 1 : N
  p0 = round(G * q0);
  if (p0 + q0 > N)
    return;
  end
  delta = abs(G - p0 / q0);
  if (delta < minDelta)
    minDelta = delta;
    p = p0; q = q0;
  end
end
end