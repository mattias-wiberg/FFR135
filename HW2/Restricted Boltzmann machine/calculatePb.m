function Pb = calculatePb(x,w,th,tv,Nh,Nv,Nout,Nin)
    p = @(b) 1/(1+exp(-2*b)); % Noise function
    Pb = zeros(8,1); % 8 possible combinations
    
    % States of layers
    v = zeros(Nv, 1);    % Visible states
    h = zeros(Nh, 1);    % Hidden states

    for no = 1:Nout
        u = randi(8);
        v = x(u,:)';

        % Update one hidden neuron
        bh = (v'*w)'-th;
        for i = 1:Nh
            if rand < p(bh(i))
                h(i) = 1;
            else
                h(i) = -1;
            end
        end

        for j = 1:Nin
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
            for l = 1:8
                if all(v'==x(l, :))
                    Pb(l)=Pb(l)+(1/(Nout*Nin));
                end
            end
        end
    end
end

