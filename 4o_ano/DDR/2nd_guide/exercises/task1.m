%% alinea a)

lambda= 20;
C= 100;
M= 4;
R= 500;
fname= 'movies.txt';


N = 10; %number of simulations
results= zeros(1,N); %vector with N simulation results
for it= 1:N
    [b(it) o(it)]= simulator1(lambda, C, M, R, fname);
end
alfa= 0.1; %90% confidence interval%

media_b = mean(b);
media_o = mean(o);

term_b = norminv(1-alfa/2)*sqrt(var(b)/N);
term_o = norminv(1-alfa/2)*sqrt(var(o)/N);

fprintf('Blocking probability (%%) = %.2e +- %.2e\n', media_b, term_b)
fprintf('Average occupation (Mbps) = %.2e +- %.2e\n', media_o, term_o)


%% alinea b
x = linspace(10,40,7);
N=10;
termos=zeros(1,N);

for it = 1:7
    for i= 1:N
        [b2(i) o2(i)]= simulator1(x(it),C,M,R,fname);
    end
   
    media_b2(it) = mean(b2);
    media_o2(it) = mean(o2);

    term_b(it) = norminv(1-alfa/2)*sqrt(var(b2)/N);
    term_o(it) = norminv(1-alfa/2)*sqrt(var(o2)/N);
end
figure(1)
bar(x, media_o2)

hold on

er = errorbar(x, media_o2, term_o, term_o);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

figure(2)
bar(x, media_b2)

hold on

er = errorbar(x, media_b2, term_b, term_b);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

%% alinea c)

% Igual à de cima mas com
R = 5000;
x = linspace(10,40,7);
N=10;
termos=zeros(1,N);

for it = 1:7
    for i= 1:N
        [b2(i) o2(i)]= simulator1(x(it),C,M,R,fname);
    end
   
    media_b2(it) = mean(b2);
    media_o2(it) = mean(o2);

    term_b(it) = norminv(1-alfa/2)*sqrt(var(b2)/N);
    term_o(it) = norminv(1-alfa/2)*sqrt(var(o2)/N);
end
figure(1)
bar(x, media_o2)

hold on

er = errorbar(x, media_o2, term_o, term_o);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

figure(2)
bar(x, media_b2)

hold on

er = errorbar(x, media_b2, term_b, term_b);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off
% Os intervalos de confiança são muito mais curtos, o que quer dizer que
% quanto maior o número de requests maior a confiança


%% alinea d
R = 5000;
x = linspace(100,400,7);
N = 10;
termos=zeros(1,N);

for it = 1:7
    for i= 1:N
        [b3(i) o3(i)]= simulator1(x(it),C,M,R,fname);
    end
   
    media_b3(it) = mean(b3);
    media_o3(it) = mean(o3);

    term_b3(it) = norminv(1-alfa/2)*sqrt(var(b3)/N);
    term_o3(it) = norminv(1-alfa/2)*sqrt(var(o3)/N);
end
figure(1)
bar(x, media_o3)

hold on

er = errorbar(x, media_o3, term_o3, term_o3);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

figure(2)
bar(x, media_b3)

hold on

er = errorbar(x, media_b3, term_b3, term_b3);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

%% alinea e)

% Blocking probability
N=100/4;
lambda = 10:5:40;

for it = 1:7   
    a= 1;
    p= 1;
    ro = (lambda(it)/60)/(1/86.3);
    for n= N:-1:1
     a= a*n/ro;
     p = p + a;
    end
    prob(it) = (1/p)*100    
end

% Average server occupation

for it = 1:7
    a=N;
    numerator= a;
    ro = (lambda(it)/60)/(1/86.3);
    for i=N-1:-1:1
     a= a*i/ro;
     numerator= numerator + a;
    end
    a= 1;
    denominator= a;
    for i= N:-1:1
     a= a*i/ro;
     denominator= denominator + a;
    end
    res(it) = numerator/denominator * 4
end

figure(1)
bar(lambda, [media_b2;prob])
hold on

figure(2)
bar(lambda, [media_o2;res])
hold on


%% alinea f)
% Blocking probability
N=1000/4;
lambda = 100:50:400;

for it = 1:7   
    a= 1;
    p= 1;
    ro = (lambda(it)/60)/(1/86.3);
    for n= N:-1:1
     a= a*n/ro;
     p = p + a;
    end
    prob5(it) = (1/p)*100    
end

% Average server occupation

for it = 1:7
    a=N;
    numerator= a;
    ro = (lambda(it)/60)/(1/86.3);
    for i=N-1:-1:1
     a= a*i/ro;
     numerator= numerator + a;
    end
    a= 1;
    denominator= a;
    for i= N:-1:1
     a= a*i/ro;
     denominator= denominator + a;
    end
    res2(it) = numerator/denominator * 4
end

figure(1)
bar(lambda, [media_b3;prob5])
hold on

figure(2)
bar(lambda, [media_o3;res2])
hold on


