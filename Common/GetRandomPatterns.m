function patterns = GetRandomPatterns(N, p)
    patterns = sign(rand(N,p)-0.5);
end