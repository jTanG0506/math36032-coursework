function isTaxicab = IsCubicTaxicabNumAlt(N)
% ISCUBICTAXICABNUM    Returns isTaxicab = 1, if N is a taxicab number
%                      Returns isTaxicab = 0, otherwise

max = floor(nthroot(N / 2, 3));
nPairs = 0;

for x = 1 : max
  y = nthroot(N - x^3, 3);
  if (y == floor(y))
    nPairs = nPairs + 1;
    if (nPairs == 2)
      isTaxicab = true;
      return;
    end
  end
end
isTaxicab = false;
end