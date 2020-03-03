function S = SumOR(N)
% SUMOR    Finds an approximation of the sum of reciprocal squares
%          by summing the first N terms

S = 0;

for n = 1:N
  S = S + 1 / n^2;
end
end