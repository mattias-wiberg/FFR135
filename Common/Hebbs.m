function weightMatrix = Hebbs(patterns)
    N = size(patterns, 1); % Row amount
    weightMatrix = 1/N*(patterns*patterns');
end