function inverted = Invert(pattern)
    inverted = pattern;
    inverted(pattern == -1) = 1;
    inverted(pattern == 1) = -1;
end

