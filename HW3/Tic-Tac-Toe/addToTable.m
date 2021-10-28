function Q = addToTable(Q, board)
    if findState(Q, board) == -1
        nStates = length(Q(1,:));
        Q{1, nStates+1} = board;
    end
end

