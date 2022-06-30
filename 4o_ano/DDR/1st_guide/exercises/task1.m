%% alínea a

p=0.6 %probabilidade de sair uma pergunta que estudou
q=1  %probabilidade de acertar a pergunta que estudou
r=0.25 %probabilidade de acertar quando nao sabe a resposta

100 * (p * q + (1-p) * r)

%% alínea b

p=0.7 %probabilidade de sair uma pergunta que estudou
r=0.2 %probabilidade de acertar quando nao sabe a resposta
%0.2*0.3

p * q + (1-p) * r; %prob acertar a resposta

%prob acertar a resposta -> 100
%prob saber (0.7) -> x
100 * p * q / (p * q + (1-p) * r)

%% alínea c

p = linspace(0,1,100)
n=3;
f3 = p + (1-p)/n;
n=4;
f4 = p + (1-p)/n;
n=5;
f5 = p + (1-p)/n;

plot(p * 100, f3 * 100, 'b-', p * 100, f4 * 100, 'b:', p * 100, f5 * 100, 'b--')
ylim([0 100])
grid on
xlabel('p(%)')
title('Probability of right answer (%)')
legend('n=3', 'n=4', 'n=5', 'location', 'northwest')
%% alínea d

n=3;
f6 = p./ (p + (1-p)/n)
n=4;
f7 = p./ (p + (1-p)/n)
n=5;
f8 = p./ (p + (1-p)/n)

plot(p * 100, f6 * 100, 'b-', p * 100, f7 * 100, 'b--', p * 100, f8 * 100, 'b:')
grid on
xlabel('p(%)')
title('Probability of known answer (%)')
legend('n=3', 'n=4', 'n=5', 'location', 'northwest')

