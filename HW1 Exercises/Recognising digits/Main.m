clear
clc

x1=[ [ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, 1, 1, 1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, -1, -1, -1, -1, -1, -1, -1] ];
x2=[ [ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1],[ -1, -1, -1, 1, 1, 1, 1, -1, -1, -1] ];
x3=[ [ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, -1, -1, -1, -1, -1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1],[ 1, 1, 1, 1, 1, 1, 1, 1, -1, -1] ];
x4=[ [ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, 1, 1, 1, 1, 1, 1, -1, -1] ];
x5=[ [ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, -1, -1, -1, -1, 1, 1, -1],[ -1, 1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, 1, 1, 1, 1, 1, 1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1],[ -1, -1, -1, -1, -1, -1, -1, 1, 1, -1] ];

patterns = [x1' x2' x3' x4' x5'];
N = length(x1); % 160
weights = Hebbs(patterns);
weights(eye(size(weights))==1) = 0; % Set diagonal to zeros
% 1
xA = [[-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [-1, -1, -1, 1, 1, 1, 1, -1, -1, -1], [1, 1, 1, -1, -1, -1, -1, 1, 1, 1]];
% 4
xB = [[-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, -1, -1, -1, -1, 1, 1, -1], [-1, 1, 1, 1, 1, 1, 1, 1, 1, -1], [-1, 1, 1, 1, 1, 1, 1, 1, 1, -1], [-1, -1, -1, -1, -1, -1, -1, 1, 1, -1], [-1, -1, -1, -1, -1, -1, -1, 1, 1, -1], [-1, -1, -1, -1, -1, -1, -1, 1, 1, -1], [-1, -1, -1, -1, -1, -1, -1, 1, 1, -1], [-1, -1, -1, -1, -1, -1, -1, 1, 1, -1], [1, 1, 1, 1, 1, 1, 1, -1, -1, 1], [1, 1, 1, 1, 1, 1, 1, -1, -1, 1]];
% 2
xC = [[-1, 1, 1, 1, 1, -1, 1, 1, -1, -1], [-1, 1, 1, 1, 1, -1, 1, 1, -1, -1], [1, -1, -1, -1, -1, -1, 1, 1, -1, -1], [1, -1, -1, -1, -1, -1, 1, 1, -1, -1], [1, -1, -1, -1, -1, -1, 1, 1, -1, -1], [1, -1, -1, -1, -1, -1, 1, 1, -1, -1], [1, -1, -1, -1, -1, -1, 1, 1, -1, -1], [-1, 1, 1, 1, 1, -1, 1, 1, -1, -1], [-1, 1, 1, 1, 1, -1, 1, 1, -1, -1], [-1, 1, 1, -1, -1, 1, -1, -1, -1, -1], [-1, 1, 1, -1, -1, 1, -1, -1, -1, -1], [-1, 1, 1, -1, -1, 1, -1, -1, -1, -1], [-1, 1, 1, -1, -1, 1, -1, -1, -1, -1], [-1, 1, 1, -1, -1, 1, -1, -1, -1, -1], [-1, 1, 1, 1, 1, -1, 1, 1, -1, -1], [-1, 1, 1, 1, 1, -1, 1, 1, -1, -1]];

x = xA;
iteration = 0;

while true
    x_old = x;
    
    for i = 1:length(x)
        %pause(0.01);
        x(i) = Sgn(weights(i,:)*x');
    end
    
    distance = 1/(4*N)*sum((x-x_old).^2)
    if ~distance % Check for steady state
        PlotPattern(x, 10, []);
        x
        iteration = iteration + 1
        break
    end
    iteration = iteration + 1
end

% Question 1
% A) [-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1;-1,-1,-1,1,1,1,1,-1,-1,-1]
% B) +2
%
% Question 2
% A) [-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,-1,-1,-1,-1,1,1,-1;-1,1,1,1,1,1,1,1,1,-1;-1,1,1,1,1,1,1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1;-1,-1,-1,-1,-1,-1,-1,1,1,-1]
% B) +4
%
% Question 3
% A) [1,1,1,1,1,1,1,1,-1,-1;1,1,1,1,1,1,1,1,-1,-1;-1,-1,-1,-1,-1,1,1,1,-1,-1;-1,-1,-1,-1,-1,1,1,1,-1,-1;-1,-1,-1,-1,-1,1,1,1,-1,-1;-1,-1,-1,-1,-1,1,1,1,-1,-1;-1,-1,-1,-1,-1,1,1,1,-1,-1;1,1,1,1,1,1,1,1,-1,-1;1,1,1,1,1,1,1,1,-1,-1;1,1,1,-1,-1,-1,-1,-1,-1,-1;1,1,1,-1,-1,-1,-1,-1,-1,-1;1,1,1,-1,-1,-1,-1,-1,-1,-1;1,1,1,-1,-1,-1,-1,-1,-1,-1;1,1,1,-1,-1,-1,-1,-1,-1,-1;1,1,1,1,1,1,1,1,-1,-1;1,1,1,1,1,1,1,1,-1,-1]
% B) +2