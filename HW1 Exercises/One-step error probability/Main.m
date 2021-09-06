clear
clc

p = [12,24,48,70,100,120]
errorP = zeros(size(p)); %Errors for each pattern
N = 120
TRIALS = 10^5

p_i = 1
for pSize = p
    for t = 1:TRIALS
        pPatterns = GetRandomPatterns(N, pSize);
        weights = Hebbs(pPatterns);
        weights(eye(size(weights))==1)=0; % Set diagonal to 0 modified hebbs
        
        % Feed one known pattern fed to the network which one dosn't matter
        % since it is random to begin with here I am always using the first
        % one (x).
        i = randi(N);
        x = pPatterns(:,1); 
        newX = Sgn(weights(i,:)*x);% Modified sign function so 0 gives 1
        
        errorP(p_i) = errorP(p_i) + (x(i,1) ~= newX); % Increase if bit changed
    end
    
    pSize
    errorP
    p_i = p_i + 1
end
errorP
errorP/TRIALS
plot(p,errorP/TRIALS)
% 12        24        48        70       100       120
% 0.0370    1.1610    5.6580    9.3970   13.6150   15.7870 %