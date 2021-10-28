function [index, matrix] = findMatch(cellArray, needle)
    for index = 1:length(cellArray(1,:))
        if isequal(cellArray{1,index}, needle)
            matrix = cellArray{1,index};
        	return
        end
    end
    matrix = zeros(size(needle));
    index = -1;
end

