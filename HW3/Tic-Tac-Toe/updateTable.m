function Q = updateTable(Q, oldBoard, board, alpha, R, gamma, lastMove, gameOver)
    % Update for Q(s,a) <- Q(s,a)+alpha*(R+gamma*max(Q(s',a'))-Q(s,a))
    i = findState(Q, board);
    if i == -1 % New state
        [Q, i] = addToTable(Q, board);
    end
    if findState(Q, oldBoard) == -1 % New state
        [Q, i] = addToTable(Q, oldBoard);
    end

    oldi = findState(Q, oldBoard);
    Qt = Q{2, oldi}(lastMove);
    if ~gameOver % Not at terminal state
        maxA = max(Q{2,i}, [], 'all'); % New max
        Q{2, oldi}(lastMove) = Qt + alpha*(gamma*maxA - Qt);
    else % at terminal state (no Q(s',a')) (game over)
        Q{2, oldi}(lastMove) = Qt + alpha*(R - Qt);
    end
end

