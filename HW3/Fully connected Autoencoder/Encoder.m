clc;
clear;

exerciseNumber = 3;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);
xTrain = double(xTrain);
xTrain = xTrain / 255; %Normalize

layersAe1 = [
    imageInputLayer([28 28 1])
    
    fullyConnectedLayer(50, 'WeightsInitializer', 'glorot')
    reluLayer
    fullyConnectedLayer(2, 'WeightsInitializer', 'glorot')
    reluLayer
    fullyConnectedLayer(784, 'WeightsInitializer', 'glorot')
    reluLayer
    regressionLayer];

layersAe2 = [
    imageInputLayer([28 28 1])
    
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
    'ExecutionEnvironment', 'gpu', ...
    'ValidationData',{xValid, tValid}, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(xTrain, tTrain,layersAe1,options);
YPred = classify(net,xTest2);
