clear
clc

trainingSet = csvread('training_set.csv');
validationSet = csvread('validation_set.csv');
xv = validationSet(:,1:2);
tv = validationSet(:,3);
x = trainingSet(:,1:2); % x1,x2 values.
t = trainingSet(:,3);   % Target values.
eta = 0.05;             % Learning rate.
cVal = 0.12;            % Classification error.
M1 = 18;                % Amount of hidden nourons.
T = size(x,1);          % Nr of samples in training set.
gPrim = @(x) 1 - tanh(x).^2; % Derivative of activation function
g = @(x) tanh(x);        % Activation function

% Initialize weights and thresholds
w1 = normrnd(0, sqrt(1/M1), [M1,2]);
t1 = zeros(M1, 1);
w2 = normrnd(0, 1, [1, M1]);
t2 = 0;

% Standardize data
m = mean(x);
s = std(x);
x = (x-m)./s;
xv = (xv-m)./s;

% States of layers
V0 = zeros(2, 1);
V1 = zeros(M1, 1);
V2 = 0;
min = 1;
epoch = 0;

while true
    epoch = epoch + 1;
    for i=1:1:T
        u = randi(T);

        % Prop forward
        V0 = x(u,:)';
        b1 = w1*V0-t1;
        V1 = g(b1);
        b2 = w2*V1-t2;
        V2 = g(b2); % L = 2

        % Back prop
        delta2 = gPrim(b2)*(t(u)-V2);
        delta1 = (w2'*delta2).*gPrim(b1);

        % Update values
        w1 = w1 + eta*delta1*V0';
        t1 = t1 - eta*delta1;
        w2 = w2 + eta*delta2*V1';
        t2 = t2 - eta*delta2;
    end

    % Prop forward
    V0v = xv';
    b1v = w1*V0v-t1;
    V1v = g(b1v);
    b2v = w2*V1v-t2;
    V2v = g(b2v); % L = 2 (Output)

    C = sum(abs(sign(V2v)'-tv))./(2*length(tv));
    if C < min
        epoch
        min = C
    end
    if C < 0.12
        break
    end
end
%% Save weights
csvwrite('w1.csv',w1)
csvwrite('w2.csv',w2')
csvwrite('t1.csv',t1)
csvwrite('t2.csv',t2)