clc;
clear;

exerciseNumber = 3;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);
xTrain = double(xTrain);
xTrain = xTrain / 255; %Normalize
% Reshape
xTrain = reshape(xTrain(:,:,1,:), 784, 1, []);
xTrain = reshape(xTrain(:,1,:), 784, []);

layersAe1 = [
    sequenceInputLayer(28*28)
    
    fullyConnectedLayer(50, 'WeightsInitializer', 'glorot')
    reluLayer
    fullyConnectedLayer(2, 'WeightsInitializer', 'glorot')
    reluLayer
    fullyConnectedLayer(784, 'WeightsInitializer', 'glorot')
    reluLayer
    regressionLayer];

layersAe2 = [
    sequenceInputLayer(28*28)
    
    fullyConnectedLayer(50, 'WeightsInitializer', 'glorot')
    reluLayer
    fullyConnectedLayer(4, 'WeightsInitializer', 'glorot')
    reluLayer
    fullyConnectedLayer(784, 'WeightsInitializer', 'glorot')
    reluLayer
    regressionLayer];

options = trainingOptions('adam', ...
    'MiniBatchSize',8192, ...
    'InitialLearnRate',0.001, ...
    'Shuffle','every-epoch', ...
    'MaxEpochs',800, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(xTrain, xTrain,layersAe1,options);
YPred = classify(net,xTest2);
