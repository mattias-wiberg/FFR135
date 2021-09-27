clear
clc

trainingSet = csvread('training_set.csv');
x = trainingSet(:,1:2); % x1,x2 values.
t = trainingSet(:,3);   % Target values.
eta = 0.05;             % Learning rate.
cVal = 0.12;            % Classification error.
M1 = 10;                % Amount of hidden nourons.
T = size(x,1);          % Nr of samples in training set.

% Initialize weights and thresholds
w1 = normrnd(0, sqrt(1/M1), [M1,2]);
t1 = zeros(M1, 1);
w2 = normrnd(0, 1, [1, M1]);
t2 = zeros(M1, 1);

% Standardize data
x = (x-mean(x))./std(x);


%%
validationSet = csvread('validation_set.csv');
x1 = trainingSet(:,1);
x2 = trainingSet(:,2);
t = trainingSet(:,3);
csvwrite('test.csv', x1)