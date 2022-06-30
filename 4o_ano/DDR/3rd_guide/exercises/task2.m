%% alinea a)
clear all 

P = 10000; % Stopping criterion
lambda = 1800;
alfa = 0.1;
N = 20; % number of simulations
C = 10;
f = 1000000;
b = 1e-6;

for i = 1:N
    [PL(i) APD(i) MPD(i) TT(i)] = simulator2(lambda,C,f,P,b);
end

media_PL = mean(PL);
media_APD = mean(APD);
media_MPD = mean(MPD);
media_TT = mean(TT);

term_PL = norminv(1-alfa/2)*sqrt(var(PL)/N);
term_APD = norminv(1-alfa/2)*sqrt(var(APD)/N);
term_MPD = norminv(1-alfa/2)*sqrt(var(MPD)/N);
term_TT = norminv(1-alfa/2)*sqrt(var(TT)/N);

fprintf('PacketLoss (%%) = %.2e +- %.2e\n', media_PL, term_PL);
fprintf('Av. Packet Delay (ms) = %.2e +- %.2e\n', media_APD, term_APD);
fprintf('Max. Packet Delay (ms) = %.2e +- %.2e\n', media_MPD, term_MPD);
fprintf('Throughput (Mbps) = %.2e +- %.2e\n', media_TT, term_TT);

%% alinea b)
clear all 

P = 10000; % Stopping criterion
lambda = 1800;
alfa = 0.1;
N = 20; % number of simulations
C = 10;
f = 1000000;
b = 1e-5;

for i = 1:N
    [PL(i) APD(i) MPD(i) TT(i)] = simulator2(lambda,C,f,P,b);
end

media_PL = mean(PL);
media_APD = mean(APD);
media_MPD = mean(MPD);
media_TT = mean(TT);

term_PL = norminv(1-alfa/2)*sqrt(var(PL)/N);
term_APD = norminv(1-alfa/2)*sqrt(var(APD)/N);
term_MPD = norminv(1-alfa/2)*sqrt(var(MPD)/N);
term_TT = norminv(1-alfa/2)*sqrt(var(TT)/N);

fprintf('PacketLoss (%%) = %.2e +- %.2e\n', media_PL, term_PL);
fprintf('Av. Packet Delay (ms) = %.2e +- %.2e\n', media_APD, term_APD);
fprintf('Max. Packet Delay (ms) = %.2e +- %.2e\n', media_MPD, term_MPD);
fprintf('Throughput (Mbps) = %.2e +- %.2e\n', media_TT, term_TT);

%% alínea c)
somatorio = 0;
lambda = 1800;
C = 10e6;       % Capacidade da ligação
a = [65:109, 111:1517];
p_each = (1 - (0.16 + 0.25 + 0.2)) / length(a);

%packet loss
for i = 64:1518
    if i == 64
        somatorio = somatorio + 0.16 * (1 - ((1 - 1e-6)^(8*i)));
    elseif i == 110
        somatorio = somatorio + 0.25 * (1 - ((1 - 1e-6)^(8*i)));
    elseif i == 1518
        somatorio = somatorio + 0.20 * (1 - ((1 - 1e-6)^(8*i)));
    else
        somatorio = somatorio + p_each * (1 - ((1 - 1e-6)^(8*i)));
    end
end
PL = 100 * somatorio;

%average packet delay

e_s = 0;
e_s2 = 0;
for i = 64:1518
    if i == 64
        e_s = e_s + 0.16 * (8 * i / C);
        e_s2 = e_s2 + 0.16 * (8 * i / C)^2;
    elseif i == 110
        e_s = e_s + 0.25 * (8 * i / C);
        e_s2 = e_s2 + 0.25 * (8 * i / C)^2;
    elseif i == 1518
        e_s = e_s + 0.20 * (8 * i / C);
        e_s2 = e_s2 + 0.20 * (8 * i / C)^2;
    else
        e_s = e_s + p_each * (8 * i / C);
        e_s2 = e_s2 + p_each * (8 * i / C)^2;
    end
end

wq = (lambda * e_s2) / (2 * (1 - lambda * e_s));

num = 0;
den = 0;
for i = 64:1518
    wi = wq + (8 * i / C);
    if i == 64
        num = num + 0.16 * ((1 - 1e-6)^(8*i)) * wi;
        den = den + 0.16 * ((1 - 1e-6)^(8*i));
    elseif i == 110
        num = num + 0.25 * ((1 - 1e-6)^(8*i)) * wi;
        den = den + 0.25 * ((1 - 1e-6)^(8*i));
    elseif i == 1518
        num = num + 0.20 * ((1 - 1e-6)^(8*i)) * wi;
        den = den + 0.20 * ((1 - 1e-6)^(8*i));
    else
        num = num + p_each * ((1 - 1e-6)^(8*i)) * wi;
        den = den + p_each * ((1 - 1e-6)^(8*i));
    end
end

APD = num/den * 1000; % multiplica -se por 1000 para transformar em milissegundos


%total throughput
TT = 0;
for i = 64:1518
    if i == 64
        TT = TT + 0.16 * (1 - 1e-6)^(8*i) * lambda * (8 * i);
    elseif i == 110
        TT = TT + 0.25 * (1 - 1e-6)^(8*i) * lambda * (8 * i);
    elseif i == 1518
        TT = TT + 0.20 * (1 - 1e-6)^(8*i) * lambda * (8 * i);
    else
        TT = TT + p_each * (1 - 1e-6)^(8*i) * lambda * (8 * i);
    end
end

fprintf('PacketLoss (%%) = %.4f \n', PL);
fprintf('Av. Packet Delay (ms) = %.4f \n', APD);
fprintf('Throughput (Mbps) = %.4f \n', TT/1e6);

%% alínea d)
somatorio = 0;
lambda = 1800;
C = 10e6;       % Capacidade da ligação
a = [65:109, 111:1517];
p_each = (1 - (0.16 + 0.25 + 0.2)) / length(a);

%packet loss
for i = 64:1518
    if i == 64
        somatorio = somatorio + 0.16 * (1 - ((1 - 1e-5)^(8*i)));
    elseif i == 110
        somatorio = somatorio + 0.25 * (1 - ((1 - 1e-5)^(8*i)));
    elseif i == 1518
        somatorio = somatorio + 0.20 * (1 - ((1 - 1e-5)^(8*i)));
    else
        somatorio = somatorio + p_each * (1 - ((1 - 1e-5)^(8*i)));
    end
end
PL = 100 * somatorio;

%average packet delay

e_s = 0
e_s2 = 0
for i = 64:1518
    if i == 64
        e_s = e_s + 0.16 * (8 * i / C);
        e_s2 = e_s2 + 0.16 * (8 * i / C)^2;
    elseif i == 110
        e_s = e_s + 0.25 * (8 * i / C);
        e_s2 = e_s2 + 0.25 * (8 * i / C)^2;
    elseif i == 1518
        e_s = e_s + 0.20 * (8 * i / C);
        e_s2 = e_s2 + 0.20 * (8 * i / C)^2;
    else
        e_s = e_s + p_each * (8 * i / C);
        e_s2 = e_s2 + p_each * (8 * i / C)^2;
    end
end

wq = (lambda * e_s2) / (2 * (1 - lambda * e_s));

num = 0;
den = 0;
for i = 64:1518
    wi = wq + (8 * i / C)
    if i == 64
        num = num + 0.16 * ((1 - 1e-5)^(8*i)) * wi;
        den = den + 0.16 * ((1 - 1e-5)^(8*i));
    elseif i == 110
        num = num + 0.25 * ((1 - 1e-5)^(8*i)) * wi;
        den = den + 0.25 * ((1 - 1e-5)^(8*i));
    elseif i == 1518
        num = num + 0.20 * ((1 - 1e-5)^(8*i)) * wi;
        den = den + 0.20 * ((1 - 1e-5)^(8*i));
    else
        num = num + p_each * ((1 - 1e-5)^(8*i)) * wi;
        den = den + p_each * ((1 - 1e-5)^(8*i));
    end
end

APD = num/den * 1000; % multiplica -se por 1000 para transformar em milissegundos


%total throughput
TT = 0;
for i = 64:1518
    if i == 64
        TT = TT + 0.16 * (1 - 1e-5)^(8*i) * lambda * (8 * i);
    elseif i == 110
        TT = TT + 0.25 * (1 - 1e-5)^(8*i) * lambda * (8 * i);
    elseif i == 1518
        TT = TT + 0.20 * (1 - 1e-5)^(8*i) * lambda * (8 * i);
    else
        TT = TT + p_each * (1 - 1e-5)^(8*i) * lambda * (8 * i);
    end
end

fprintf('PacketLoss (%%) = %.4f \n', PL);
fprintf('Av. Packet Delay (ms) = %.4f \n', APD);
fprintf('Throughput (Mbps) = %.4f \n', TT/1e6);