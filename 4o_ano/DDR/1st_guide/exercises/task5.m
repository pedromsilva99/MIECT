%% alínea 5-a)
%n cadeias de 64 bytes
%estados de interferencia -> 10^-3 e 10^-2
%estados normais -> 10^-6, 10^-5 e 10^-4

b = 64*8;
h = 2:5;

prob_erro_1 = (1 - (1 - 10^-6) ^ b) .^ h;
prob_erro_2 = (1 - (1 - 10^-5) ^ b) .^ h;
prob_erro_3 = (1 - (1 - 10^-4) ^ b) .^ h;
prob_erro_4 = (1 - (1 - 10^-3) ^ b) .^ h;
prob_erro_5 = (1 - (1 - 10^-2) ^ b) .^ h;

prob_total_1 = prob_erro_1 * p1 ./ (prob_erro_1 * p1 + prob_erro_2 * p2 + prob_erro_3 * p3 + prob_erro_4 * p4 + prob_erro_5 * p5);
prob_total_2 = prob_erro_2 * p2 ./ (prob_erro_1 * p1 + prob_erro_2 * p2 + prob_erro_3 * p3 + prob_erro_4 * p4 + prob_erro_5 * p5);
prob_total_3 = prob_erro_3 * p3 ./ (prob_erro_1 * p1 + prob_erro_2 * p2 + prob_erro_3 * p3 + prob_erro_4 * p4 + prob_erro_5 * p5);

prob_total = prob_total_1 + prob_total_2 + prob_total_3

semilogy( h, prob_total, 'b-')

grid on
xlabel('Control frames')
title('Probability of false positives')
xlim([1, 6])



%% alínea 5-b)

b = 64*8;
h = 2:5;
%h = 2;



prob_erro_1 = (1 - (1 - 10^-6) ^ b) .^ h;
prob_erro_2 = (1 - (1 - 10^-5) ^ b) .^ h;
prob_erro_3 = (1 - (1 - 10^-4) ^ b) .^ h;
prob_erro_4 = (1 - (1 - 10^-3) ^ b) .^ h;
prob_erro_5 = (1 - (1 - 10^-2) ^ b) .^ h;

prob_n_erros_1 = 1 - prob_erro_1;
prob_n_erros_2 = 1 - prob_erro_2;
prob_n_erros_3 = 1 - prob_erro_3;
prob_n_erros_4 = 1 - prob_erro_4;
prob_n_erros_5 = 1 - prob_erro_5;

prob_total_4 = prob_n_erros_4 * p4 ./ (prob_n_erros_1 * p1 + prob_n_erros_2 * p2 + prob_n_erros_3 * p3 + prob_n_erros_4 * p4 + prob_n_erros_5 * p5);
prob_total_5 = prob_n_erros_5 * p5 ./ (prob_n_erros_1 * p1 + prob_n_erros_2 * p2 + prob_n_erros_3 * p3 + prob_n_erros_4 * p4 + prob_n_erros_5 * p5);

prob_total = prob_total_4 + prob_total_5


plot( h, prob_total, 'b-')
grid on
xlabel('Control frames')
title('Probability of false negatives')
xlim([1, 6])

%% alínea 5-c)
% n=5