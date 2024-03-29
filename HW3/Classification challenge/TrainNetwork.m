xTest2 = loadmnist2();
exerciseNumber = 3;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);

% Layer Values taken from MathWorks 'Create Simple Deep Learning Network
% for Classification'
layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,8,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,16,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',4, ...
    'Shuffle','every-epoch', ...
    'ValidationData',{xValid, tValid}, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');



network = trainNetwork(xTrain, tTrain,layers,options);
yPrediction = classify(network,xTest2);
