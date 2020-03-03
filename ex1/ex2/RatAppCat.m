function [p, q] = RatAppCat(N)
% RATAPPCAT    Returns the best approximation p / q of the Catalan's 
%              constant, among all pairs of (p, q) such that p + q <= N.

G = 0.915965594177219;
p = 0; q = 1;                          % The best (p, q) pair so far
minDelta = abs(G - p / q);             % The difference between p / q and G

for q0 = 1 : N
  p0 = round(G * q0);                  % Observation 2.3
  if (p0 + q0 > N)                     % Claim 2.4
    return
  end
  delta = abs(G - p0 / q0);              
  if (delta < minDelta)                % Update if current pair is better
    minDelta = delta;                  % than the best pair we have seen
    p = p0; q = q0;
  end
end
end
