%% alinea a)
clear all 

P = 100000; % Stopping criterion
lambda = 1800;
alfa = 0.1;
N = 10; % number of simulations
C = 10;
f = 1e6;
b = 0;

for i = 1:N
    [PL(i) APD(i) MPD(i) TT(i)] = simulator3(lambda,C,f,P,b);
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

%% alínea b)

clear all 

P = 100000; % Stopping criterion
lambda = 1800;
alfa = 0.1;
N = 10; % number of simulations
C = 10;
f = 1e4;
b = 1e-6;

for i = 1:N
    [PL(i) APD(i) MPD(i) TT(i)] = simulator3(lambda,C,f,P,b);
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

clear all 

P = 100000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 10; % number of simulations
C = 10;
f = 10000000;
b = 0;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
        [PL2(i)  APD2(i)  MPD2(i)  TT2(i)] = simulator3(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        media_PL2(it) = mean(PL2);
        media_APD2(it) = mean(APD2);
        media_MPD2(it) = mean(MPD2);
        media_TT2(it) = mean(TT2);
       
end

% PL
figure(1)
bar(lambda, [media_PL; media_PL2])
title('Packet loss (%)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% APD
figure(2)
bar(lambda, [media_APD; media_APD2])
title('Average packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% MPD
figure(3)
bar(lambda, [media_MPD; media_MPD2])
title('Maximum packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% TT
figure(4)
bar(lambda, [media_TT; media_TT2])
title('Transmitted throughput (Mbps)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

%% alínea d)

clear all

C = 10;
f = 2500:2500:20000;
b = 0;
P = 100000;
alfa = 0.1;     % 90% confidence interval
lambda = 1800;
N = 40;

for it = 1:8
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda,C,f(it),P,b);
        [PL2(i)  APD2(i)  MPD2(i)  TT2(i)] = simulator3(lambda,C,f(it),P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        media_PL2(it) = mean(PL2);
        media_APD2(it) = mean(APD2);
        media_MPD2(it) = mean(MPD2);
        media_TT2(it) = mean(TT2);
end


% PL
figure(1)
bar(f, [media_PL; media_PL2])
title('Packet loss (%)')
legend('Simulator2', 'Simulator3', 'location', 'northeast')
grid on

% APD
figure(2)
bar(f, [media_APD; media_APD2])
title('Average packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% MPD
figure(3)
bar(f, [media_MPD; media_MPD2])
title('Maximum packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% TT
figure(4)
bar(f, [media_TT; media_TT2])
title('Transmitted throughput (Mbps)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on


%% alínea e)

clear all 

P = 100000; % Stopping criterion
lambda = 1500:100:2000;
alfa = 0.1;
N = 10; % number of simulations
C = 10;
f = 10000000;
b = 1e-5;

for it = 1:6
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda(it),C,f,P,b);
        [PL2(i)  APD2(i)  MPD2(i)  TT2(i)] = simulator3(lambda(it),C,f,P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        media_PL2(it) = mean(PL2);
        media_APD2(it) = mean(APD2);
        media_MPD2(it) = mean(MPD2);
        media_TT2(it) = mean(TT2);
       
end

% PL
figure(1)
bar(lambda, [media_PL; media_PL2])
title('Packet loss (%)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% APD
figure(2)
bar(lambda, [media_APD; media_APD2])
title('Average packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% MPD
figure(3)
bar(lambda, [media_MPD; media_MPD2])
title('Maximum packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% TT
figure(4)
bar(lambda, [media_TT; media_TT2])
title('Transmitted throughput (Mbps)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

%% alínea f)

clear all

C = 10;
f = 2500:2500:20000;
b = 1e-5;
P = 100000;
alfa = 0.1;     % 90% confidence interval
lambda = 1800;
N = 40;

for it = 1:8
    for i= 1:N
        [PL(i)  APD(i)  MPD(i)  TT(i)] = simulator2(lambda,C,f(it),P,b);
        [PL2(i)  APD2(i)  MPD2(i)  TT2(i)] = simulator3(lambda,C,f(it),P,b);
    end
        media_PL(it) = mean(PL);
        media_APD(it) = mean(APD);
        media_MPD(it) = mean(MPD);
        media_TT(it) = mean(TT);
        
        media_PL2(it) = mean(PL2);
        media_APD2(it) = mean(APD2);
        media_MPD2(it) = mean(MPD2);
        media_TT2(it) = mean(TT2);
end


% PL
figure(1)
bar(f, [media_PL; media_PL2])
title('Packet loss (%)')
legend('Simulator2', 'Simulator3', 'location', 'northeast')
grid on

% APD
figure(2)
bar(f, [media_APD; media_APD2])
title('Average packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% MPD
figure(3)
bar(f, [media_MPD; media_MPD2])
title('Maximum packet delay (milliseconds)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

% TT
figure(4)
bar(f, [media_TT; media_TT2])
title('Transmitted throughput (Mbps)')
legend('Simulator2', 'Simulator3', 'location', 'northwest')
grid on

