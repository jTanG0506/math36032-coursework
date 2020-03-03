function n = PrimeOmega(N)
% PRIMEOMEGA    Returns the number of prime factors of a natural number N,
%               taking into account multiplicity

n = length(factor(N));
end
