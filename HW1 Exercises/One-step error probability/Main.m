clear
clc

p = [12,24,48,70,100,120]
errorP = zeros(size(p)); %Errors for each pattern
N = 120
TRIALS = 100%10^5

p_i = 1;
for pSize = p
    for t = 1:TRIALS
        pPatterns = GetRandomPatterns(N, pSize);
        weights = Hebbs(pPatterns);
        %weights = weights - (p_i/N)*eye(size(weights)) % Modified Hebb's Rule w_ii = 0
        weights(eye(size(weights)) == 1) = 0; % Modified Hebb's Rule w_ii = 0
        
        % Feed one known pattern fed to the network which one dosn't matter
        % since it is random to begin with
        x = pPatterns(:,1); 
        i = randi(N);
        j = randi(N);
        errorP(p_i) = errorP(p_i) + (x(j) ~= sign(weights(i,j)*x(j))); % Increase if but changed
    end
    pSize
    p_i = p_i + 1
    errorP
end