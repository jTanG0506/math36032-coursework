function ctn = CubicTaxicabNum(N)
% CUBICTAXICABNUM    Returns the smallest cubic taxicab number greater
%                    than or equal to N

ctn = N;

while (~IsCubicTaxicabNum(ctn))
    ctn = ctn + 1;
end

end