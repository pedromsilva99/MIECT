%% alínea a
somatorio = 1 + 8/600 + 8/600 * 5/200 + 8/600 * 5/200 * 2/50 + 8/600 * 5/200 * 2/50 * 1/5;
p1 = 1 / somatorio;
p2 = 8/600 / somatorio;
p3 = 8/600 * 5/200 / somatorio;
p4 = 8/600 * 5/200 * 2/50 / somatorio;
p5 = 8/600 * 5/200 * 2/50 * 1/5 / somatorio;
p_normal = p1 + p2 + p3;
p_interf = p4 + p5;

fprintf('Prob normal state = %.7f\n', p_normal)
fprintf('Prob interference state = %.7f\n', p_interf)


%% alínea b
% interference state -> p4 e p5
% normal state -> p1, p2 e p3

mediaint = (p4*10^-3 + p5*10^-2)/(p4+p5);
medianor = (p1*10^-6 + p2*10^-5 + p3*10^-4)/(p1+p2+p3);

fprintf('Average ber in interference state = %.2e\n', mediaint)
fprintf('Average ber in normal state = %.2e\n', medianor)


%% alínea c
h=linspace(64*8, 200*8);

prob_erro_1 = (1 - (1 - 10^-6).^h);
prob_erro_2 = (1 - (1 - 10^-5).^h);
prob_erro_3 = (1 - (1 - 10^-4).^h);
prob_erro_4 = (1 - (1 - 10^-3).^h);
prob_erro_5 = (1 - (1 - 10^-2).^h);

prob_total_1 = prob_erro_1 * p1 ./ (prob_erro_1 * p1 + prob_erro_2 * p2 + prob_erro_3 * p3 + prob_erro_4 * p4 + prob_erro_5 * p5);
prob_total_2 = prob_erro_2 * p2 ./ (prob_erro_1 * p1 + prob_erro_2 * p2 + prob_erro_3 * p3 + prob_erro_4 * p4 + prob_erro_5 * p5);
prob_total_3 = prob_erro_3 * p3 ./ (prob_erro_1 * p1 + prob_erro_2 * p2 + prob_erro_3 * p3 + prob_erro_4 * p4 + prob_erro_5 * p5);

prob_total = prob_total_1 + prob_total_2 + prob_total_3;

plot( h/8, prob_total, 'b-')
xlim([50, 214])

grid on
xlabel('Packet size (Bytes)')
title('Probability of packet reception with errors')
legend('prob normal state', 'location', 'southwest')


%% alínea d

h=linspace(64*8, 200*8);

prob_n_erro_1 = (1 - 10^-6).^h;
prob_n_erro_2 = (1 - 10^-5).^h;
prob_n_erro_3 = (1 - 10^-4).^h;
prob_n_erro_4 = (1 - 10^-3).^h;
prob_n_erro_5 = (1 - 10^-2).^h;

prob_total_4 = prob_n_erro_4 * p4 ./ (prob_n_erro_1 * p1 + prob_n_erro_2 * p2 + prob_n_erro_3 * p3 + prob_n_erro_4 * p4 + prob_n_erro_5 * p5);
prob_total_5 = prob_n_erro_5 * p5 ./ (prob_n_erro_1 * p1 + prob_n_erro_2 * p2 + prob_n_erro_3 * p3 + prob_n_erro_4 * p4 + prob_n_erro_5 * p5);

prob_total = prob_total_4 + prob_total_5;

plot( h/8, prob_total, 'b-')
xlim([50, 214])

grid on
xlabel('Packet size (Bytes)')
title('Probability of packet reception without errors')
legend('prob int state', 'location', 'southwest')