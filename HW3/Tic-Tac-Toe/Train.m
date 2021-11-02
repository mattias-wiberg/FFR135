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
gamesBeforeDecay = 10000;
gamesPerDecay = 100;
beta = 0.95;
nGames = 30000;
winnerHistory = zeros(1, nGames);

% There are two agents player 1 and 2 with each own Q table
% Q tables
Q1 = cell(2,1,1); % Player 1 (X)
Q1{1,1} = zeros(3,3);
Q1{2,1} = zeros(3,3);
Q2 = Q1; % Player 2 (O)
%%
for game = 10000:nGames
    history = [];
    history(:,:,1) = initilizeBoard(3,3);
    [history(:,:,2), lastMoveP1] = playPlayer(1, history(:,:,1), Q1, epsilon);
    [history(:,:,3), lastMoveP2] = playPlayer(-1, history(:,:,2), Q2, epsilon);
    
    Q1 = updateTable(Q1, history(:,:,end-2), history(:,:,end), alpha, 0, gamma, lastMoveP1, false);
    cell2mat(Q1);
    while ~gameOver(history(:,:,1))
        [history(:,:,end+1), newMove] = playPlayer(1, history(:,:,end), Q1, epsilon);
        [over, R] = gameOver(history(:,:,end));
        if over
            Q1 = updateTable(Q1, history(:,:,end-1), history(:,:,end), alpha, R(1), gamma, newMove, over);
            Q2 = updateTable(Q2, history(:,:,end-2), history(:,:,end), alpha, R(2), gamma, lastMoveP2, over);
            break;
        else
            Q2 = updateTable(Q2, history(:,:,end-2), history(:,:,end), alpha, 0, gamma, lastMoveP2, over);
        end
        lastMoveP1 = newMove;
        
        [history(:,:,end+1), newMove] = playPlayer(-1, history(:,:,end), Q2, epsilon);
        [over, R] = gameOver(history(:,:,end));
        if over
            Q2 = updateTable(Q2, history(:,:,end-1), history(:,:,end), alpha, R(2), gamma, newMove, over);
            Q1 = updateTable(Q1, history(:,:,end-2), history(:,:,end), alpha, R(1), gamma, lastMoveP1, over);
            break;
        else
            Q1 = updateTable(Q1, history(:,:,end-2), history(:,:,end), alpha, 0, gamma, lastMoveP1, over);
        end
        lastMoveP2 = newMove;
    end
    
    winnerHistory(game) = R(1);
    
    if game > gamesBeforeDecay % 1 for the first 10^4 games
        if mod(game, gamesPerDecay) == 0 % each 100 games
            fprintf("Game %d\n", game);
            epsilon = epsilon * beta;
        end
    end
end

%%
reshape(winnerHistory, 30,[]);
average = 50;
xFraq = [];
oFraq = [];
for i = 1:length(winnerHistory)-average
    xFraq(end+1) = sum(winnerHistory(i:i+average)==1)/average;
    oFraq(end+1) = sum(winnerHistory(i:i+average)==-1)/average;
end
csvwrite("player1.csv", cell2mat(Q1));
csvwrite("player2.csv", cell2mat(Q2));

plot(xFraq)
hold on
plot(oFraq)
legend("X","O")
