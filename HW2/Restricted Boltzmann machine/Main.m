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
avgTimes = 20;     
Nv = 3;                % Amount of visible nourons.
k = 100;               % Amount of updates
trails = 1000;          % Amount of trials
Nout = 1000;
Nin = 1000;

Pbs = zeros(length(Nh), 8, length(Nout));
KLs = zeros(length(Nh), length(Nout));
t=0;

for out=Nout
    t = t + 1
    j=0;
    for hidden=Nh
        j = j + 1
        avgPb = zeros(avgTimes, 8);
        avgKL = zeros(avgTimes, 1);
        for k = 1:avgTimes
            [w, th, tv] = trainRBM(x(1:4,:),Nv,hidden,trails,k,eta);

            Pb = calculatePb(x,w,th,tv,hidden,Nv,out,Nin);
            avgPb(k,:)=Pb;
            KL = 0;
            for i = 1:4
                KL =KL+log(1/(4*Pb(i)));
            end
            KL=1/4*KL;
            if abs(KL) ~= Inf
                avgKL(k) = KL;
            end
            k
        end
        KLs(j,t) = mean(avgKL);
        Pbs(j,:,t) = mean(avgPb);
    end
end
%% Plotting
plot(Nh, KLs)