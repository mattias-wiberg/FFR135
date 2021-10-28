function Q = addToTable(Q, board)
    if findState(Q, board) == -1
        nStates = length(Q(1,:));
        Q{1, nStates+1} = board;
        Q{2, nStates+1} = zeros(size(board));
    end
end

