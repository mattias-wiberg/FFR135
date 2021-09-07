clear
clc

EXPERIMENTS = 100;
BETA = 2;
prob = @(b) 1/(1+exp(-2*BETA*b));

p = 45;
N = 200;
T = 2*10^5;
m = zeros(EXPERIMENTS, 1);

for experiment = 1:EXPERIMENTS
    patterns = GetRandomPatterns(N, p);
    weights = Hebbs(patterns);
    weights(eye(size(weights))==1) = 0; % Set diagonal to zeros w_ii=0
    s = patterns(:,1); % feed _x^(1)
    
    for update = 1:T
        i = randi(N);
        b_i = weights(i,:)*s;
        if rand() < prob(b_i)
            s(i) = 1;
        else
            s(i) = -1;
        end
        m(experiment) = m(experiment) + 1/N*s'*patterns(:,1);
    end
    m(experiment) = m(experiment)/T;
    experiment
end

avg = sum(m)/EXPERIMENTS
plot(1:EXPERIMENTS, m)

% <m_1(T)>  T=2⋅10^​5, p=7, N=200, β=2
% 0.9020
% <m_1(T)>  T=2⋅10^​5, p=45, N=200, β=2
% 0.1422