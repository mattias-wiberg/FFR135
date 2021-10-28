function Q = updateTable(Q, board, alpha, R, gamma)
    % Update for Q(s,a) <- Q(s,a)+alpha*(R+gamma*max(Q(s',a'))-Q(s,a))
    [i, M] = findState(Q, board)
end

