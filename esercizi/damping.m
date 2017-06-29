function ysignal = damping(range, period, alpha, nsample)
%
%
% calcola ysignal e stampa il plot
%
% 1) range: intervallo di definizione
% 2) period: periodo
% 3) alpha: coefficiente di attenuazione
% 4) nsample: numero di campioni
%
% Silvia Gioia Florio, matr. 119328
% version 1.0, 28/02/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% interval starting point
tmin = range(1,1);
% interval ending point
tmax = range(1,2);
% sampling step
deltat = (tmax-tmin)/(nsample-1);

% array of t values
ti = tmin:deltat:tmax;

% cosine function
func1 = cos(2*pi/period*ti);

% exponential function
func2 = exp(-alpha*ti);

% damping function
ysignal = func1.*func2;

%
%% visualizzazione %%
%

% cosine plot
%

% plot
subplot(1,3,1) % 1/3
plot(ti,func1)

% axis labels
xlabel('t')
ylabel('cos')

% title
title('cosine')

% exponential plot
%

% plot
subplot(1,3,2) % 2/3 
plot(ti,func2)

% axis label
xlabel('t')
ylabel('exp')

% title
title('exponetial')

% damping plot
%

% plot
subplot(1,3,3) % 3/3
plot(ti,ysignal)

% axis label
xlabel('t')
ylabel('ysig')

% title
title('damping')

end;