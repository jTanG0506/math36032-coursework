function isTaxicab = IsCubicTaxicabNum(N)
% ISCUBICTAXICABNUM    Returns isTaxicab = 1, if N is a taxicab number
%                      Returns isTaxicab = 0, otherwise

nPairs = 0;
left = 1;
right = floor(nthroot(N, 3));                    % Claim 1.4

while (left <= right)
    sum = left^3 + right^3;
    if (sum == N)
        nPairs = nPairs + 1;
        if (nPairs == 2)                         % If we have found the
            isTaxicab = true;                    % second pair, we are done
            return;
        end
        left = left + 1;                         % Observation 1.5
        right = right - 1;                       % Observation 1.5
    elseif (sum < N)
        left = left + 1;                         % Observation 1.6
    else
        right = right - 1;                       % Observation 1.7
    end
end
isTaxicab = false;
end