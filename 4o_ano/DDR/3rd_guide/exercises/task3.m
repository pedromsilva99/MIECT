%% alinea a) e alínea b)
clear all 

P = 10000; % Stopping criterion
lambda = 1500:100:2000; % packet rate (packets/sec)
alfa = 0.1; 
N = 10; % number of simulations
C = 10;
f = 10000000;
b = 0;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        term_PL(it) = norminv(1-alfa/2)*sqrt(var(PL)/N);
        term_APD(it) = norminv(1-alfa/2)*sqrt(var(APD)/N);
        term_MPD(it) = norminv(1-alfa/2)*sqrt(var(MPD)/N);
        term_TT(it) = norminv(1-alfa/2)*sqrt(var(TT)/N);
end

% APD
figure(1)
subplot(1,2,1)
bar(lambda, media_APD)
title('Average packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_APD, term_APD, term_APD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% MPD
figure(2)
subplot(1,2,1)
bar(lambda, media_MPD)
title('Maximum packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_MPD, term_MPD, term_MPD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% TT
figure(3)
subplot(1,2,1)
bar(lambda, media_TT)
title('Transmitted throughput (Mbps)')
ylim([0 11])
grid on
hold on

% Error bar
er = errorbar(lambda, media_TT, term_TT, term_TT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

clear all 

P = 10000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 40; % number of simulations
C = 10;
f = 10000000;
b = 0;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        term_PL(it) = norminv(1-alfa/2)*sqrt(var(PL)/N);
        term_APD(it) = norminv(1-alfa/2)*sqrt(var(APD)/N);
        term_MPD(it) = norminv(1-alfa/2)*sqrt(var(MPD)/N);
        term_TT(it) = norminv(1-alfa/2)*sqrt(var(TT)/N);
end

% APD
figure(1)

subplot(1,2,2)
bar(lambda, media_APD)
title('Average packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_APD, term_APD, term_APD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% MPD
figure(2)
subplot(1,2,2)
bar(lambda, media_MPD)
title('Maximum packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_MPD, term_MPD, term_MPD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% TT
figure(3)
subplot(1,2,2)
bar(lambda, media_TT)
title('Transmitted throughput (Mbps)')
ylim([0 11])
grid on
hold on

% Error bar
er = errorbar(lambda, media_TT, term_TT, term_TT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

%% alinea c)

clear all 

P = 10000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 40; % number of simulations
C = 10;
f = 10000000;
b = 0;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
    end
        media_APD(it) = mean(APD);
        media_TT(it) = mean(TT);
end

media = mean([65:109, 111:1517]);
C = 10e6;       % Capacidade da ligação
% Tamanho médio por pacote (em bits)
B = 0.16 * 64 + 0.25 * 110 + 0.2 * 1518 + 0.39 * media;
B = B * 8;
miu = (C / B)
a = [65:109, 111:1517];
p_each = (1 - (0.16 + 0.25 + 0.2)) / length(a);
E_S = (B / C);
E_S_2 = 0.16 * (64 * 8 / C)^2 + 0.25 * (110 * 8 / C)^2 + 0.2 * (1518 * 8 / C)^2;
for i = 1:length(a)
    E_S_2 = E_S_2 + p_each * (a(i) * 8 / C)^2;
end    


for it = 1:6
    % M/M/1
    W1(it) = 1 / (miu - lambda(it)) * 1000;
    TT1(it) = lambda(it) * B / 1e6;
    % M/G/1
    W2(it) = ((lambda(it) * E_S_2) / (2 * (1 - lambda(it) * E_S)) + E_S) * 1000;
    TT2(it) = lambda(it) * B / 1e6;
end

% PL
figure(1)
bar(lambda, [media_APD; W1; W2])
title('Average packet delay (milliseconds)')
legend('Simulation', 'M/M/1', 'M/G/1', 'location', 'northwest')
ylim([-20 120])
grid on

% APL
figure(2)
bar(lambda, [media_TT; TT1; TT2])
title('Transmitted throughput (Mbps)')
legend('Simulation', 'M/M/1', 'M/G/1', 'location', 'northwest')
grid on



%% Alínea d) e f)

clear all

C = 10;
f = 2500:2500:20000;
b = 0;
P = 10000;
alfa = 0.1;     % 90% confidence interval
lambda = 1800;
N = 40;

for it = 1:8
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda, C, f(it), P, b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        term_PL(it) = norminv(1-alfa/2)*sqrt(var(PL)/N);
        term_APD(it) = norminv(1-alfa/2)*sqrt(var(APD)/N);
        term_MPD(it) = norminv(1-alfa/2)*sqrt(var(MPD)/N);
        term_TT(it) = norminv(1-alfa/2)*sqrt(var(TT)/N);
end


% PL
figure(1)
subplot(1,2,1)
bar(f, media_PL)
title('Packet loss (%)')
ylim([0 15])
grid on
hold on

% Error bar
er = errorbar(f, media_PL, term_PL, term_PL);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% APD
figure(2)
subplot(1,2,1)
bar(f, media_APD)
title('Average packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(f, media_APD, term_APD, term_APD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% MPD
figure(3)
subplot(1,2,1)
bar(f, media_MPD)
title('Maximum packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(f, media_MPD, term_MPD, term_MPD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% TT
figure(4)
subplot(1,2,1)
bar(f, media_TT)
title('Transmitted throughput (Mbps)')
ylim([6 10])
grid on
hold on

% Error bar
er = errorbar(f, media_TT, term_TT, term_TT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

clear all

C = 10;
f = 2500:2500:20000;
b = 1e-5;
P = 10000;
alfa = 0.1;     % 90% confidence interval
lambda = 1800;
N = 40;

for it = 1:8
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda, C, f(it), P, b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        term_PL(it) = norminv(1-alfa/2)*sqrt(var(PL)/N);
        term_APD(it) = norminv(1-alfa/2)*sqrt(var(APD)/N);
        term_MPD(it) = norminv(1-alfa/2)*sqrt(var(MPD)/N);
        term_TT(it) = norminv(1-alfa/2)*sqrt(var(TT)/N);
end


% PL
figure(1)
subplot(1,2,2)
bar(f, media_PL)
title('Packet loss (%)')
ylim([0 15])
grid on
hold on

% Error bar
er = errorbar(f, media_PL, term_PL, term_PL);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% APD
figure(2)
subplot(1,2,2)
bar(f, media_APD)
title('Average packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(f, media_APD, term_APD, term_APD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% MPD
figure(3)
subplot(1,2,2)
bar(f, media_MPD)
title('Maximum packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(f, media_MPD, term_MPD, term_MPD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% TT
figure(4)
subplot(1,2,2)
bar(f, media_TT)
title('Transmitted throughput (Mbps)')
ylim([6 10])
grid on
hold on

% Error bar
er = errorbar(f, media_TT, term_TT, term_TT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

%% Alínea e)

clear all

C = 10;
f = 2500:2500:20000;
b = 0;
P = 10000;
alfa = 0.1;     % 90% confidence interval
lambda = 1800;
N = 40;

for it = 1:8
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda, C, f(it), P, b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_TT(it) = mean(TT);
end

C=10 * 1000000;
media = mean([65:109, 111:1517]);
media;
% Tamanho médio por pacote (em bits)
B = 0.16 * 64 + 0.25 * 110 + 0.2 * 1518 + 0.39 * media;
B = B * 8;
miu = (C / B);  % Sempre que o miu é superior ao lambda o modelo é valido
                % porque tem espera infinita
f = 2500:2500:20000;
for i = 1:8
    m = f(i) * 8 / B + 1;
    m = round(m);
    
    somatorio = 0;
    for j = 0:m
        somatorio = somatorio + ((lambda / miu)^j);
    end
    miu_m(i) = 100 * ((lambda/miu)^m) / somatorio
    
    somatorio_2 = 0;
    somatorio_3 = 0;
    for k = 0:m
        somatorio_2 = somatorio_2 + (k * ((lambda/miu)^k));
        somatorio_3 = somatorio_3 + ((lambda/miu)^k);
    end
    
    L = somatorio_2/somatorio_3
    W(i) = L / (lambda * (1 - miu_m(i)/100)) * 1000;
    TT2(i) = (lambda * B / 1e6) * (1-miu_m(i)/100);
end

% PL
figure(1)
bar(f, [media_PL; miu_m])
title('Packet Loss')
legend('Simulation', 'M/M/1/m', 'location', 'northwest')
ylim([0 20])
grid on

% APL
figure(2)
bar(f, [media_APD; W])
title('Av. Packet Delay (ms)')
legend('Simulation', 'M/M/1/m', 'location', 'northwest')
grid on

% TT
figure(3)
bar(f, [media_TT; TT2])
title('Throughput (Mbps)')
legend('Simulation', 'M/M/1/m', 'location', 'northwest')
grid on

%% Alínea g) 

clear all 

P = 10000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 40; % number of simulations
C = 10;
f = 10000000;
b = 0;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        term_PL(it) = norminv(1-alfa/2)*sqrt(var(PL)/N);
        term_APD(it) = norminv(1-alfa/2)*sqrt(var(APD)/N);
        term_MPD(it) = norminv(1-alfa/2)*sqrt(var(MPD)/N);
        term_TT(it) = norminv(1-alfa/2)*sqrt(var(TT)/N);
end

% PL
figure(1)
subplot(1,2,1)
bar(lambda, media_PL)
title('Packet loss (%)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_PL, term_PL, term_PL);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% APD
figure(2)

subplot(1,2,1)
bar(lambda, media_APD)
title('Average packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_APD, term_APD, term_APD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% MPD
figure(3)
subplot(1,2,1)
bar(lambda, media_MPD)
title('Maximum packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_MPD, term_MPD, term_MPD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% TT
figure(4)
subplot(1,2,1)
bar(lambda, media_TT)
title('Transmitted throughput (Mbps)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_TT, term_TT, term_TT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

clear all 

P = 10000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 40; % number of simulations
C = 10;
f = 10000000;
b = 10e-6;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        term_PL(it) = norminv(1-alfa/2)*sqrt(var(PL)/N);
        term_APD(it) = norminv(1-alfa/2)*sqrt(var(APD)/N);
        term_MPD(it) = norminv(1-alfa/2)*sqrt(var(MPD)/N);
        term_TT(it) = norminv(1-alfa/2)*sqrt(var(TT)/N);
end

% PL
figure(1)
subplot(1,2,2)
bar(lambda, media_PL)
title('Packet loss (%)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_PL, term_PL, term_PL);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% APD
figure(2)

subplot(1,2,2)
bar(lambda, media_APD)
title('Average packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_APD, term_APD, term_APD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% MPD
figure(3)
subplot(1,2,2)
bar(lambda, media_MPD)
title('Maximum packet delay (milliseconds)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_MPD, term_MPD, term_MPD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% TT
figure(4)
subplot(1,2,2)
bar(lambda, media_TT)
title('Transmitted throughput (Mbps)')
grid on
hold on

% Error bar
er = errorbar(lambda, media_TT, term_TT, term_TT);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off


%% Alínea h)

clear all 

P = 10000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 40; % number of simulations
C = 10;
f = 10000000;
b = 10e-6;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_TT(it) = mean(TT);    
end

somatorio = 0;
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
PL2 = 100 * somatorio;

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
for i = 1:6
    wq(i) = (lambda(i) * e_s2) / (2 * (1 - lambda(i) * e_s));
end


num = [0,0,0,0,0,0];
den = [0,0,0,0,0,0];
for it = 1:6
    for i = 64:1518
        wi = wq(it) + (8 * i / C);
        if i == 64
            num(it) = num(it) + 0.16 * ((1 - 1e-5)^(8*i)) * wi;
            den(it) = den(it) + 0.16 * ((1 - 1e-5)^(8*i));
        elseif i == 110
            num(it) = num(it) + 0.25 * ((1 - 1e-5)^(8*i)) * wi;
            den(it) = den(it) + 0.25 * ((1 - 1e-5)^(8*i));
        elseif i == 1518
            num(it) = num(it) + 0.20 * ((1 - 1e-5)^(8*i)) * wi;
            den(it) = den(it) + 0.20 * ((1 - 1e-5)^(8*i));
        else
            num(it) = num(it) + p_each * ((1 - 1e-5)^(8*i)) * wi;
            den(it) = den(it) + p_each * ((1 - 1e-5)^(8*i));
        end
    end
    APD2(it) = num(it)/den(it) * 1000; % multiplica -se por 1000 para transformar em milissegundos
end

%total throughput
TT2 = [0,0,0,0,0,0];
for it = 1:6
    for i = 64:1518
        if i == 64
            TT2(it) = TT2(it) + 0.16 * (1 - 1e-5)^(8*i) * lambda(it) * (8 * i);
        elseif i == 110
            TT2(it) = TT2(it) + 0.25 * (1 - 1e-5)^(8*i) * lambda(it) * (8 * i);
        elseif i == 1518
            TT2(it) = TT2(it) + 0.20 * (1 - 1e-5)^(8*i) * lambda(it) * (8 * i);
        else
            TT2(it) = TT2(it) + p_each * (1 - 1e-5)^(8*i) * lambda(it) * (8 * i);
        end
    end
end

% APL
figure(1)
bar(lambda, [media_APD; APD2])
title('Av. Packet Delay (ms)')
legend('Simulation', 'M/G/1 with ber', 'location', 'northwest')
grid on

% TT
figure(2)
bar(lambda, [media_TT; TT2/1e6])
title('Throughput (Mbps)')
legend('Simulation', 'M/G/1 with ber', 'location', 'northwest')
grid on