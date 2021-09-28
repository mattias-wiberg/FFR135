function [w,th,tv] = trainRBM(x,Nv,Nh,trails,k, eta)
    T = 20;                 % Nr of samples in training set.
    g = @(b) tanh(b);        % Activation function
    p = @(b) 1/(1+exp(-2*b)); % Noise function
    
    % Initialize weights and thresholds
    w = normrnd(0, 1, [Nv,Nh]);
    th = zeros(Nh, 1);
    tv = zeros(Nv, 1);

    % States of layers
    v = zeros(Nv, 1);    % Visible states
    h = zeros(Nh, 1);    % Hidden states

    for trial=1:trails
        dw = zeros(Nv, Nh);
        dtv = zeros(Nv, 1);
        dth = zeros(Nh, 1);
        for update=1:T
            u = randi(length(x));
            v = x(u,:)';

            v0 = v;
            bh = (v'*w)'-th;
            for i = 1:Nh
                if rand < p(bh(i))
                    h(i) = 1;
                else
                    h(i) = -1;
                end
            end
            for j = 1:k
                % Update visible neurons
                bv = w*h-tv;
                for i = 1:Nv
                    if rand < p(bv(i))
                        v(i) = 1;
                    else
                        v(i) = -1;
                    end
                end
                % Update hidden neurons
                bh = (v'*w)'-th;
                for i = 1:Nh
                    if rand < p(bh(i))
                        h(i) = 1;
                    else
                        h(i) = -1;
                    end
                end
            end
            bh0 = (v0'*w)'-th;
            % Calc Errors
            dw = dw+eta*(v0*g(bh0)'-v*g(bh)');
            dtv = dtv - eta*(v0-v);
            dth = dth - eta*(g(bh0)-g(bh));
        end

        % Update weights and thresholds
        w = w + dw;
        tv = tv + dtv;
        th = th + dth;
    end
end

