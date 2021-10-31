function [newBoard, move] = playPlayer(mark, board, Q, epsilon)
    newBoard = board;
    move = randomPosition(board);
    if rand < epsilon % Pick random position and play it
        newBoard(move) = mark;
    else % Pick best expected future reward position
        [i, M] = findState(Q, board);
        if i ~= -1 % State found
            [~, move] = max(Q{2,i}, [], 'all', 'linear');
        end
        newBoard(move) = mark;
    end
end

