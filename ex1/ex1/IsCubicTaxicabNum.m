function isTaxicab = IsCubicTaxicabNum(N)
% ISCUBICTAXICABNUM    Returns isTaxicab = 1, if N is a taxicab number
%                      Returns isTaxicab = 0, otherwise

nPairs = 0;

left = 0;
right = floor(nthroot(N, 3));

while (left < right)
    sum = left^3 + right^3;
    if (sum == N)
        nPairs = nPairs + 1;
        if (nPairs == 2)
            isTaxicab = true;
            return;
        end
        left = left + 1;
        right = right - 1;
    elseif (sum < N)
        left = left + 1;
    else
        right = right - 1;
    end
end

isTaxicab = false;

end