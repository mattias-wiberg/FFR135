%% Train
% Q table with rows as states and columns as actions for that state,
% in other words state action pairs.
% Update for Q(s,a) <- Q(s,a)+alpha*(R+gamma*max(Q(s',a'))-Q(s,a))
% Where
% R = reward (1 = win , 0 = draw, -1 = loss)
% max(Q(s',a')) = expected future reward(R)
clc;
clear;
alpha = 0.1; % learning rate
gamma = 1; % discount factor (how long in the feature are you looking)
% Greedy parameter decrease with beta = 0.95 each 100 games (Exploration)
% Select action with biggest value in q table and random action
% (best included) with 1-epsilon prob
epsilon = 1;
beta = 0.95;

nGames = 5000;

% There are two agents player 1 and 2 with each own Q table
% Q tables
Q1 = cell(2,1,1); % Player 1 (X)
Q2 = cell(2,1,1); % Player 2 (O)

for game = 1:nGames
    board = initilizeBoard(3,3);
    board = playPlayer(1, board, Q1, epsilon);
    board = playPlayer(-1, board, Q2, epsilon);
    Q1 = addToTable(Q1, board);
    
    while ~gameOver(board)
        board = playPlayer(1, board, Q1, epsilon);
        if gameOver(board)
            break;
        else
            Q2 = addToTable(Q2, board);
        end
        board = playPlayer(-1, board, Q2, epsilon);
        if gameOver(board)
            break;
        else
            Q1 = addToTable(Q1, board);
        end
    end
    
    [~, R] = gameOver(board);
    %Q1 = updateTable(Q1, 1, board, alpha, R, gamma, epsilon)
    %Q2 = updateTable(Q2, -1, board, alpha, R, gamma, epsilon)
    
    
    if mod(game, 100) == 0
        epsilon = epsilon * beta;
    end
end