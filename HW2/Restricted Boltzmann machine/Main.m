clear
clc

x = [-1 -1 -1
     1 -1 1
     -1 1 1
     1 1 -1
     -1 -1 1
     -1 1 -1
     1 -1 -1
     1 1 1];
eta = 0.1;             % Learning rate.
Nh = [1 2 4 8];        % Amount of hidden nourons.
avgTimes = 10;     
Nv = 3;                % Amount of visible nourons.
k = 100;               % Amount of updates
trails = 100;          % Amount of trials
Nout = 1000;
Nin = 1000;

Pbs = zeros(length(Nh), 8);
KLs = zeros(length(Nh), 1);
j=0;

for hidden=Nh
    j = j + 1
    avgPb = zeros(avgTimes, 8);
    avgKL = zeros(avgTimes, 1);
    for k = 1:avgTimes
        [w, th, tv] = trainRBM(x(1:4,:),Nv,hidden,trails,k,eta);

        Pb = calculatePb(x,w,th,tv,hidden,Nv,Nout,Nin);
        avgPb(k,:)=Pb;
        KL = 0;
        for i = 1:4
            KL =KL+log(1/(4*Pb(i)));
        end
        KL=1/4*KL;
        if KL ~= -Inf
            avgKL(k) = KL;
        end
        k
    end
    KLs(j) = mean(avgKL);
    Pbs(j,:) = mean(avgPb);
end