clear
clc

p = [12,24,48,70,100,120]
errorP = zeros(size(p)); %Errors for each pattern
N = 120
TRIALS = 10^5

p_i = 1;
for pSize = p
    for t = 1:TRIALS
        pPatterns = GetRandomPatterns(N, pSize);
        
        % Feed one known pattern fed to the network which one dosn't matter
        % since it is random to begin with here I am always using the first
        % one (x).
        i = randi(N);
        j = randi(N);
        x_j = pPatterns(j,1); 
        
        % Calulate weight
        w_ij = 0;
        if i ~= j % Modified Hebb's Rule w_ii=0
            for u = 1:pSize
                w_ij = w_ij + pPatterns(i,u)*pPatterns(j,u);
            end
            w_ij = w_ij/N;
        end
        
        newX = Sgn(w_ij * x_j); % Modified sign function 0 gives 1
        errorP(p_i) = errorP(p_i) + (x_j ~= newX); % Increase if bit changed
    end
    
    pSize
    errorP
    p_i = p_i + 1
end
errorP
errorP/TRIALS
plot(p,errorP/TRIALS)