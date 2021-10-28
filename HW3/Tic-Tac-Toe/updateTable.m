function Q = updateTable(Q, mark, board, alpha, R, gamma, epsilon)
    % Update for Q(s,a) <- Q(s,a)+alpha*(R+gamma*max(Q(s',a'))-Q(s,a))
    [i, M] = findState(Q, board);
    nStates = length(Q(1,:));
    if i == -1 % New state
        Q{1, nStates+1} = board;
        Q{2, nStates+1} = zeros(size(board));
    else % Update
        board = playPlayer(mark, board, Q, epsilon);
        iS = findState(Q, board);
        Q{2, i} = Q{2, i} + alpha*(R + gamma*max(Q{2,iS})-Q{2,i})
    end
end

