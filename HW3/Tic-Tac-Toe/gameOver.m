function [over, rewards] = gameOver(board)
    rewards = [0;0];
    terminalStates = [1 1 1 0 0 0 0 0 0 1 0 0 0 1 0 0 0 1 0 0 1 1 0 0;
                      0 0 0 1 1 1 0 0 0 1 0 0 0 1 0 0 0 1 0 1 0 0 1 0;
                      0 0 0 0 0 0 1 1 1 1 0 0 0 1 0 0 0 1 1 0 0 0 0 1;];
    terminalStates = reshape(terminalStates, 3, 3, 8)&1; % logical
    for i = 1:8
        total = sum(board(terminalStates(:,:,i)));
        if abs(total)>2 % A player won
            over = true;
            rewards = [1;-1]*sign(total);
            return;
        end
    end
    
    if sum(board.^2, 'all') == numel(board) % Tie
        over = true;
        rewards = [0;0];
        return;
    end
    
    over = false;
end

