clear
clc

p = 7
N = 200
T = 2*10^5
EXPERIMENTS = 100

for experiment = 1:EXPERIMENTS
    patterns = GetRandomPatterns(N, p)
end
