%% Alinea a)

R = 10000;
lambda = 100:20:200;
p = 0.2;
alfa = 0.1;     % 90% confidence interval
W = 0;
fname = 'movies.txt';
N = 10;

%  Configuration 1
n = 10;
S = 100;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media_HD(it) = mean(b_hd);
        media_4K(it) = mean(b_4k);
        
        term_HD(it) = norminv(1-alfa/2)*sqrt(var(b_hd)/N);
        term_4K(it) = norminv(1-alfa/2)*sqrt(var(b_4k)/N);
end

% HD
figure(1)
bar(lambda, media_HD)
title('Blocking probability of HD movies (W = 0)')
ylim([0 100])
grid on
hold on

% Error bar
er = errorbar(lambda, media_HD, term_HD, term_HD);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

% 4K
figure(2)
bar(lambda, media_4K)
title('Blocking probability of 4K movies (W = 0)')
ylim([0 100])
grid on
hold on

% Error bar
er = errorbar(lambda, media_4K, term_4K, term_4K);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off


%% Alinea b)

R = 10000;
lambda = 100:20:200;
p = 0.2;
alfa = 0.1;     % 90% confidence interval
W = 0;
fname = 'movies.txt';
N = 10;

%  Configuration 1
n = 10;
S = 100;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media1_HD(it) = mean(b_hd);
        media1_4K(it) = mean(b_4k);
end

%  Configuration 2
n = 4;
S = 250;
lambda = 100:20:200;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media2_HD(it) = mean(b_hd);
        media2_4K(it) = mean(b_4k);
end

%  Configuration 3
n = 1;
S = 1000;
lambda = 100:20:200;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media3_HD(it) = mean(b_hd);
        media3_4K(it) = mean(b_4k);
end

% HD
figure(1)
bar(lambda, [media1_HD; media2_HD; media3_HD])
title('Blocking probability of HD movies (W = 0)')
legend('Configuration 1', 'Configuration 2', 'Configuration 3', 'location', 'northwest')
ylim([0 100])
grid on

% 4K
figure(2)
bar(lambda, [media1_4K; media2_4K; media3_4K])
title('Blocking probability of 4K movies (W = 0)')
legend('Configuration 1', 'Configuration 2', 'Configuration 3', 'location', 'northwest')
ylim([0 100])
grid on

%% Alinea c)

R = 10000;
lambda = 100:20:200;
p = 0.2;
alfa = 0.1;     % 90% confidence interval
W = 400;
fname = 'movies.txt';
N = 10;

%  Configuration 1
n = 10;
S = 100;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media1_HD(it) = mean(b_hd);
        media1_4K(it) = mean(b_4k);
end

%  Configuration 2
n = 4;
S = 250;
lambda = 100:20:200;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media2_HD(it) = mean(b_hd);
        media2_4K(it) = mean(b_4k);
end

%  Configuration 3
n = 1;
S = 1000;
lambda = 100:20:200;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media3_HD(it) = mean(b_hd);
        media3_4K(it) = mean(b_4k);
end

% HD
figure(1)
bar(lambda, [media1_HD; media2_HD; media3_HD])
title('Blocking probability of HD movies (W = 400)')
legend('Configuration 1', 'Configuration 2', 'Configuration 3', 'location', 'northwest')
ylim([0 100])
grid on

% 4K
figure(2)
bar(lambda, [media1_4K; media2_4K; media3_4K])
title('Blocking probability of 4K movies (W = 400)')
legend('Configuration 1', 'Configuration 2', 'Configuration 3', 'location', 'northwest')
ylim([0 100])
grid on


%% Alinea d)

R = 10000;
lambda = 100:20:200;
p = 0.2;
alfa = 0.1;     % 90% confidence interval
W = 600;
fname = 'movies.txt';
N = 10;

%  Configuration 1
n = 10;
S = 100;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media1_HD(it) = mean(b_hd);
        media1_4K(it) = mean(b_4k);
end

%  Configuration 2
n = 4;
S = 250;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media2_HD(it) = mean(b_hd);
        media2_4K(it) = mean(b_4k);
end

%  Configuration 3
n = 1;
S = 1000;

for it = 1:6
    for i= 1:N
        [b_hd(i) b_4k(i)] = simulator2(lambda(it),p,n,S,W,R,fname);
    end
        media3_HD(it) = mean(b_hd);
        media3_4K(it) = mean(b_4k);
end

% HD
figure(1)
bar(lambda, [media1_HD; media2_HD; media3_HD])
title('Blocking probability of HD movies (W = 600)')
legend('Configuration 1', 'Configuration 2', 'Configuration 3', 'location', 'northwest')
ylim([0 100])
grid on

% 4K
figure(2)
bar(lambda, [media1_4K; media2_4K; media3_4K])
title('Blocking probability of 4K movies (W = 600)')
legend('Configuration 1', 'Configuration 2', 'Configuration 3', 'location', 'northwest')
ylim([0 100])
grid on


%% Alinea e)

fname = 'movies.txt';
%W = 0:10000:70000;
W = 30000;
lambda = 4167; %100 000 / 24
num_subscribers = 100000;
percent_golden = 0.24;
percent_regular = 1 - 0.24;
movies_per_day = 1;

p_worst_all_work = 0.1;  % Worst blocking probability when all servers are working.
p_worst_one_fails = 1;   % Worst blocking probability when one servers fails.

n = 7;
S = 10000;  % 10 GB (10000 MB)
R = 100000;

for it = 1:1
    
   [b_hd b_4k] = simulator2(lambda,percent_golden,n,S,W,R,fname)
end

