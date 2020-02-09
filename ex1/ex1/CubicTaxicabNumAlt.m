function ctn = CubicTaxicabNumAlt(N)
% CUBICTAXICABNUM    Returns the smallest cubic taxicab number greater
%                    than or equal to N

ctn = N;

while (~IsCubicTaxicabNumAlt(ctn))
    ctn = ctn + 1;
end

end