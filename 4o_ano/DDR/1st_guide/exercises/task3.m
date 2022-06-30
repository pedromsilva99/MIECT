%% alínea a
somatorio=1 + 1/180 + 1/180 * 20/40 + 1/180 * 20/40 * 10/20 + 1/180 * 20/40 * 10/20 * 5/2;
p1=1 / somatorio;
p2=1/180 / somatorio;
p3=1/180 * 20/40 / somatorio;
p4=1/180 * 20/40 * 10/20 / somatorio;
p5=1/180 * 20/40 * 10/20 * 5/2 / somatorio;
fprintf('p1 = %.3e\n', p1)
fprintf('p2 = %.3e\n', p2)
fprintf('p3 = %.3e\n', p3)
fprintf('p4 = %.3e\n', p4)
fprintf('p5 = %.3e\n', p5)

%% alínea b
%a probabilidade de cada estado também é o tempo que se passa em cada
%estado num sistema ergódico e irredutível

%% alínea c
media = (p1*10^-6 + p2*10^-5 + p3*10^-4 + p4*10^-3 + p5*10^-2)
fprintf('media = %.2e\n', media)

%% alínea d
min = 60;
e1 = 1/1;
e2 = 1/(180+20);
e3 = 1/(40+10);
e4 = 1/(20+5);
e5 = 1/2;
fprintf('tm e1 = %.1f \n', e1 * min)
fprintf('tm e2 = %.2f \n', e2 * min)
fprintf('tm e3 = %.2f \n', e3 * min)
fprintf('tm e4 = %.2f \n', e4 * min)
fprintf('tm e5 = %.1f \n', e5 * min)

%% alínea e
fprintf('prob interferencia = %.2e \n', p4 + p5)

%% alínea f
mediaint = (p4*10^-3 + p5*10^-2)/(p4+p5);
fprintf('media = %.2e\n', mediaint)

