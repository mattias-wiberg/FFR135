function [Q, index] = addToTable(Q, board)
    Q{1, end+1} = board;
    Q{2, end} = zeros(size(board));
    % Set all non playable positions to NaN in action table.
    Q{2, end}(board.^2==1) = NaN;
    index = length(Q(1,:));
end

