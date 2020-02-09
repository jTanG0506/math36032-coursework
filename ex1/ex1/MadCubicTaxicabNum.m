function ctn = MadCubicTaxicabNum(N)
ctn = N;
done = false;
while(~done)
  ctn = ctn + 1;
  s = floor(nthroot(ctn, 3));
  done = nnz(((1:s).^3' * ones(1, s) + (1:s).^3) == ctn) >= 4;
end
end