function index = randomPosition(board)
    % Gives random available position
    possiblePositions = (1-board.^2);
    [~, index] = max(rand(size(board)).*possiblePositions,[],'all', 'linear');
end

