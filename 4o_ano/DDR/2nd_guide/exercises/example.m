% f(x) = x^2
% g(x) = x/(x+1)

x= linspace(0,1,80)
f= x.^2
g= x./(x+1)

plot(x,f,'b-',x,g,'r:')
grid on
ylim([0 1.1])
xlabel('x')
title('Titulo')
legend('f(x)','g(x)','location','northwest')