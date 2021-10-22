%% Load data and set up layers
clc;
clear;

exerciseNumber = 3;
[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(exerciseNumber);
xTrain = double(xTrain);
xTrain = xTrain / 255; %Normalize
xTest = double(xTest);
xTest = xTest / 255; %Normalize
% Reshape
xTrain = reshape(xTrain(:,:,1,:), 784, 1, []);
xTrain = reshape(xTrain(:,1,:), 784, []);

xTest = reshape(xTest(:,:,1,:), 784, 1, []);
xTest = reshape(xTest(:,1,:), 784, []);

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

%% Train
options = trainingOptions('adam', ...
    'MiniBatchSize',8192, ...
    'InitialLearnRate',0.001, ...
    'Shuffle','every-epoch', ...
    'MaxEpochs',800, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

netAe1 = trainNetwork(xTrain, xTrain,layersAe1,options);
netAe2 = trainNetwork(xTrain, xTrain,layersAe2,options);
%% Auto Encoder 1
net = netAe1;
layers_encode = [netAe1.Layers(1:5); regressionLayer];
layers_decode = [sequenceInputLayer(2); netAe1.Layers(6:8)];
net_encode = assembleNetwork(layers_encode);
net_decode = assembleNetwork(layers_decode);
%% Auto Encoder 2
net = netAe2;
layers_encode = [netAe2.Layers(1:5); regressionLayer];
layers_decode = [sequenceInputLayer(4); netAe2.Layers(6:8)];
net_encode = assembleNetwork(layers_encode);
net_decode = assembleNetwork(layers_decode);
%% Montage
for i = 1:10
    classified_points(i).arr = [];
end
amount = 50;
hold off;
fig = figure(1);
data = xTest;

for i = 1:amount
    subplot(1,2,1);
    imshow(reshape(data(:, i), 28, 28));
    subplot(1,2,2);
    Y = predict(net, data(:, i));
    imshow(reshape(Y, 28, 28));
    point = predict(net_encode, data(:, i))
    figure(fig); % Focus figure
    
    k = waitforbuttonpress;
    % If enter
    if 13 ~= double(get(gcf,'CurrentCharacter'))
        index = double(tTrain(i));
        classified_points(index).arr = [classified_points(index).arr point];
    end 
end

%% Plot points in scatter
clf;
legends = [];
for i = 1:10
    array = classified_points(i).arr;
    if ~isempty(array)
        scatter(array(1,:), array(2,:), 'x');
        legends = [legends num2str(i-1)+""];
    end
    hold on;
end
scatter(bad_points(1,:), bad_points(2,:), 'x', 'black');
legend([legends "poor conversion"]);
%% Concat classified Points
array = [];
bad_points = [array classified_points(1:10).arr]
