%% alinea a)
clear all 

P = 10000; % Stopping criterion
lambda = 1800;
alfa = 0.1;
N = 10; % number of simulations
C = 10;
f = 1000000;

for i = 1:N
    [PL(i) APD(i) MPD(i) TT(i)] = simulator1(lambda,C,f,P);
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

f = 10000;
for i = 1:N
    [PL(i) APD(i) MPD(i) TT(i)] = simulator1(lambda,C,f,P);
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

% devido à diminuição da fila de espera, melhoramos o packet delay,
% prejudicando o packet loss.

%% alínea c)

%qualquer modelo com fila de espera infinita tem o packet loss = 0


mediana1 = (109 + 65) / 2;
n1 = 109 - 65 + 1;
mediana2 = (1517+111) / 2;
n2 = 1517 - 111 + 1;
media = (n1 * mediana1 + n2 * mediana2) / (n1 + n2)


lambda = 1800;
C = 10e6;       % Capacidade da ligação

% Tamanho médio por pacote (em bits)
B = 0.16 * 64 + 0.25 * 110 + 0.2 * 1518 + 0.39 * media;
B = B * 8;
miu = (C / B);  % Sempre que o miu é superior ao lambda o modelo é valido
                % porque tem espera infinita

PL = 0; % Porque se tem espera infinita nunca há perda de valores.
W = 1 / (miu - lambda) * 1000   % Em milissegundos
TT = lambda * B / 1e6

%% Alinea d)

a = [65:109, 111:1517];
p_each = (1 - (0.16 + 0.25 + 0.2)) / length(a);
E_S = (B / C);
E_S_2 = 0.16 * (64 * 8 / C)^2 + 0.25 * (110 * 8 / C)^2 + 0.2 * (1518 * 8 / C)^2

for i = 1:length(a)
    E_S_2 = E_S_2 + p_each * (a(i) * 8 / C)^2;
end    

PL = 0; % Porque se tem espera infinita nunca há perda de valores.
((lambda * E_S_2) / (2 * (1 - lambda * E_S)) + E_S) * 1000
TT = lambda * B / 1e6

%% Alínea e)

clear all
C=10 * 1000000;
lambda = 1800;
media = mean([65:109, 111:1517]);
media;
% Tamanho médio por pacote (em bits)
B = 0.16 * 64 + 0.25 * 110 + 0.2 * 1518 + 0.39 * media;
B = B * 8;
miu = (C / B);  % Sempre que o miu é superior ao lambda o modelo é valido
                % porque tem espera infinita
m = 10000 * 8 / B + 1;
m = round(m);
somatorio = 0;
for j = 0:m
    somatorio = somatorio + ((lambda / miu)^j);
end
somatorio;
miu_m = 100 * ((lambda/miu)^m) / somatorio

somatorio_2 = 0;
somatorio_3 = 0;
for k = 0:m
    somatorio_2 = somatorio_2 + (k * ((lambda/miu)^k));
    somatorio_3 = somatorio_3 + ((lambda/miu)^k);
end
L = somatorio_2/somatorio_3;
W = L / (lambda * (1 - miu_m/100)) * 1000;
TT = (lambda * B / 1e6) * (1-miu_m/100);

