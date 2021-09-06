clear
clc

EXPERIMENTS = 100;
BETA = 2;
prob = @(b) 1/(1+exp(-2*BETA*b));

p = 7;
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
        s(i) = Sgn(prob(weights(i,:)*s));
        m(experiment) = m(experiment) + 1/N*s'*patterns(:,1);
    end
    m(experiment) = m(experiment)/T;
    m(experiment)
end

sum(m)/EXPERIMENTS