%%
n=100
p=100000
sums = sum(sign(rand([n, p])-0.5));
X = [unique(sums)', countcats(categorical(sums))']
plot(X(1), X(2));

function [ret] = s_random(n)
    ret = sign(rand([n, 1])-0.5);
end
