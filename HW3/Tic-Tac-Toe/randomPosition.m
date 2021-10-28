function index = randomPosition(board)
    % Gives random available position
    [~, index] = max(rand(size(board)).*board.^2,[],'all', 'linear');
end

