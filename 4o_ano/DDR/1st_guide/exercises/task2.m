%% alínea a
p = 10^-2 %probabilidade de erro 
b=100*8   %numero de bits

a=(1-p)^b*100

%% alínea b
p = 10^-3
b=1000*8  %numero de bits
n = nchoosek(b,1)
b = n * p*(1-p)^(b-1) * 100

%% alínea c
p = 10^-4 %probabilidade de erro 
b=200*8   %numero de bits

a= 100 - (1-p)^b *100

%% alínea d
p=logspace(-8, -2)
b=100*8
a1=(1-p).^b
b=200*8
a2=(1-p).^b
b=1000*8
a3=(1-p).^b
semilogx(p,100*a1,'b-',p,100*a2,'b--',p,100*a3,'b:')
grid on
xlabel('Bit Error Rate')
title('Probability of packet reception without errors (%)')
legend('100 Bytes', '200 Bytes', '1000 Bytes', 'location', 'southwest')

%% alinea e

h=linspace(64*8, 1518*8)


p=10^-4
a1=(1-p).^h
p=10^-3
a2=(1-p).^h
p=10^-2
a3=(1-p).^h

semilogy(h/8, a1, 'b-', h/8, a2, 'b--', h/8, a3, 'b:')
xlim([0, 1600])

grid on
xlabel('Packet size (Bytes)')
title('Probability of packet reception without errors')
legend('ber=1e-4', 'ber=1e-3', 'ber=1e-2', 'location', 'southwest')