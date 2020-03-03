function ctn = MatrixCubicTaxicabNum(N)
ctn = N;
isCtn = @(n, s) nnz(((1:s).^3' * ones(1, s) + (1:s).^3) == n) >= 4;
while (~isCtn(ctn, floor(nthroot(ctn, 3))))
  ctn = ctn + 1;
end
end