clear;
clc;

p = [12,24,48,70,100,120];
errorP = zeros(size(p)); %Errors for each pattern
N = 120;
TRIALS = 10^5;

p_i = 1;
for pSize = p
    for t = 1:TRIALS
        pPatterns = GetRandomPatterns(N, pSize);
        
        % Feed one known pattern fed to the network which one dosn't matter
        % since it is random to begin with here I am always using the first
        % one (x).
        i = randi(N);
        x = pPatterns(:,1);
        
        % Only calculate the weights that are going to be used
        weights = pPatterns(i,:)*pPatterns'; 
        weights(i) = 0; % w_ii = 0
        newX = Sgn(weights*x);% Modified sign function so 0 gives 1
        
        errorP(p_i) = errorP(p_i) + (x(i,1) ~= newX); % Increase if bit changed
    end
    
    errorP;
    p_i = p_i + 1;
end
errorP;
errorP/TRIALS;
plot(p,errorP/TRIALS);
% 12        24        48        70        100       120
% 0.0005    0.0114    0.0552    0.0951    0.1363    0.1598      w_ii = 0
% 0.0001    0.0031    0.0128    0.0186    0.0209    0.0222      w_ii ~= 0