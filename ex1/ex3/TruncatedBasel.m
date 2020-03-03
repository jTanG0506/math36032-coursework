function k = TruncatedBasel(bound)
% TRUNCATEDBASEL    Returns k such that the sum of the reciprocal squares
%                   of terms k + 1 to infinity are less than the bound

  k = 1;
  S = pi^2 / 6;

  while (S >= bound)
    S = S - 1 / k^2;
    k = k + 1;
  end
end