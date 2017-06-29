function noise = sigNoise(signal, variance)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for noise addition to a signal.
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Esercizio 2.11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% initialize variables
%   size of the input signal
sizeS = size(signal);
%   maximum intensity value in the input signal
maxS = max(signal);
%   output
noise = [];

%% calculate variance value
varianceS = maxS*variance;

%% initialize random noise vector
noiseBase = randn(sizeS);
noise = noiseBase*varianceS;

%% calculate noised signal
noise = signal + noise;