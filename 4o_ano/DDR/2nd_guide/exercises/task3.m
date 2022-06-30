%% Alinea a)

matrix;
s = G(:,1);
t = G(:,2);
D = graph(s,t);
plot(D);

I = zeros(40);
C = zeros(1,40);

r = 6:1:40;
c = [12 12 12 12 12 12 12 12 12 12 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8];
n = length(r);

fid = fopen('3a.lp','wt');

fprintf(fid,'Minimize\n');
for i=1:n
    fprintf(fid,' + %d x%d',c(i),r(i));
end
fprintf(fid,'\nSubject To\n');

for j = 6:1:40
    for i = 6:1:40
        P = shortestpath(D,j,i);
        if (length(P) <= 3)
            fprintf(fid,' + x%d', i);
        end
    end
    fprintf(fid,' >= 1 \n');
end


fprintf(fid,'Binary\n');
for i=1:n
    fprintf(fid,' x%d\n',r(i));
end


fprintf(fid,'End\n');
fclose(fid);

%% Alinea b)
clear all

% Max blocking probability = 1%
size_hd = 5;
size_4k = 25;
server_capacity = 1000;
%n_servers = x;


R = 100000;
lambda = (5000*10+2500*25) / 24; % numero total de requests por hora
p = 0.3;    % probabilidade de ser 4K
alfa = 0.1;     % 90% confidence interval
W = 51400;
fname = 'movies.txt';
N = 10;

%  Configuration 1
n = 75;
S = 1000;

for i= 1:N
    [b_hd(i) b_4k(i)] = simulator2(lambda,p,n,S,W,R,fname);
end

media_HD = mean(b_hd);
media_4K = mean(b_4k);

term_HD = norminv(1-alfa/2)*sqrt(var(b_hd)/N);
term_4K = norminv(1-alfa/2)*sqrt(var(b_4k)/N);

fprintf('\nWith %d servers:\n', n);
fprintf('Blocking probability HD (%%) = %.6f +- %.6f\n', media_HD, term_HD);
fprintf('Blocking probability 4K (%%) = %.6f +- %.6f\n', media_4K, term_4K);

%% Alinea c)

n9 = [9, 10, 22, 23, 24, 25, 26, 27];
n9_subs = 2 * 5000 + 6 * 2500;
n13 = [13, 14, 33, 34, 35, 36, 37, 38];
n13_subs = 2 * 5000 + 6 * 2500;
n16 = [6, 15, 16, 17, 18, 19, 39, 40];
n16_subs = 2 * 5000 + 6 * 2500;
n21 = [7, 8, 20, 21];
n21_subs = 2 * 5000 + 2 * 2500;
n30 = [11, 12, 28, 29, 30, 31, 32];
n30_subs = 2 * 5000 + 5 * 2500;

subscribers = n9_subs + n13_subs + n16_subs + n21_subs + n30_subs;

n9_servers = n9_subs * 76 / subscribers; 
n13_servers = n13_subs * 76 / subscribers;
n16_servers = n16_subs * 76 / subscribers; 
n21_servers = n21_subs * 76 / subscribers; 
n30_servers = n30_subs * 76 / subscribers; 


