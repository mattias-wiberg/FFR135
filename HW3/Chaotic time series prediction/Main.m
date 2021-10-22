clc;
clear;

% Load Data
xTrain = csvread('training-set.csv');
xTest = csvread('test-set-8.csv');

% Constants
dt = 0.02; % Step size (seconds)
n = 3; % Input neurons
N = 500; % Reservoir
tSteps = 500; % Time steps
tTrain = size(xTrain, 2); % Training Steps

% Init weights to mean zero
wInVar = 0.002;
wVar = 2/N;
k = 0.01;

wIn = normrnd(0, sqrt(wInVar), N, n);
w = normrnd(0, sqrt(wVar), N, N);
wOut = zeros(n, N);

R = zeros(N, tTrain);
r = zeros(N, 1);

for t=1:tTrain
    R(:,t) = r;
    r = tanh(w*r+wIn*xTrain(:,t));
end

wOut = xTrain*R'*inv(R*R'+k*eye(N));

% Feed xTest
tTrain = size(xTest, 2);
R = zeros(N, tTrain + tSteps);
r = zeros(N, 1);

for t=1:tTrain
    R(:,t) = r;
    r = tanh(w*r+wIn*xTest(:,t));
end

% Predict 500 times 
y = zeros(tSteps, 1);

for t=tTrain:tTrain+tSteps
    R(:,t) = r;
    O = wOut*R(:,t);
    y(t-tTrain+1) = O(2);
    r = tanh(w*r+wIn*O);
end

csvwrite('prediction.csv', y(2:end));