function newBoard = playPlayer(mark, board, Q, epsilon)
    newBoard = board;
    if rand < epsilon % Pick random position and play it
        newBoard(randomPosition(newBoard)) = mark;
    else % Pick best expected future reward position
        [i, M] = findState(Q, board);
        if i == -1 % No state found
            newBoard(randomPosition(newBoard)) = mark;
        else
            newBoard(M == max(M)) = mark;
        end
    end
end

