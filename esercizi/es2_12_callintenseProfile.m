%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for generating intensity profiles.
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Excercise 2.12
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% ramp and roof %
%   initialize sequence
seqRR = [0 0 0 4 8 12 0 0 0 12 0 0 0];
%   calling intensity profiling function
nsample = 100;
profileRR = IntProfile(seqRR, nsample);
% step edge %
%   initialize sequence
seqSE = [0 0 0 4 4 0 0 0 8 8 0 0 0];
%   calling intensity profiling function
nsample = 100;
profileSE = IntProfile(seqSE, nsample);
%
% visualization %
figure;
subplot(2,1,1), plot(profileRR), title('ramp and roof intensity profile'), grid();
subplot(2,1,2), plot(profileSE), title('step-edge intensity profile'), grid();
%
%% noises %%
% calculate noises %
% ramp and roof low noise
noiseRRLow = sigNoise(profileRR, 0.01);
% ramp and roof high noise
noiseRRHigh = sigNoise(profileRR, 0.2);
% step-edge low noise
noiseSELow = sigNoise(profileSE, 0.01);
% step-edge high noise
noiseSEHigh = sigNoise(profileSE, 0.2);
%
% visualization %
figure;
% ramp and roof
subplot(2,2,1), plot(noiseRRLow), title('ramp and roof low noise'), grid();
subplot(2,2,2), plot(noiseRRHigh), title('ramp and roof high noise'), grid();
%   step-edge
subplot(2,2,3), plot(noiseSELow), title('step-edge low noise'), grid();
subplot(2,2,4), plot(noiseSEHigh), title('step-edge high noise'), grid();
%
%% masks %%
% initialize masks
maskSum = [1 1];
maskDiff = [1 -1];
% initialize filters - profiles
filterProfileRRSum = conv(profileRR, maskSum);
filterProfileRRDiff = conv(profileRR, maskDiff);
filterProfileSESum = conv(profileSE, maskSum);
filterProfileSEDiff = conv(profileSE, maskDiff);
%
% visualize filters %
figure;
subplot(2,2,1), plot(filterProfileRRSum), title('filter ramp and roof sum mask'), grid()
subplot(2,2,2), plot(filterProfileRRDiff), title('filter ramp and roof difference mask'), grid()
subplot(2,2,3), plot(filterProfileSESum), title('filter step-edge sum mask'), grid()
subplot(2,2,4), plot(filterProfileSEDiff), title('filter step-edge difference mask'), grid()
% 
% initialize filters - noised ramp and roof %
filterNoiseRRLowSum = conv(noiseRRLow, maskSum);
filterNoiseRRLowDiff = conv(noiseRRLow, maskDiff);
filterNoiseRRHighSum = conv(noiseRRHigh, maskSum);
filterNoiseRRHighDiff = conv(noiseRRHigh, maskDiff);
%
% visualize filters %
figure;
subplot(2,2,1), plot(filterNoiseRRLowSum), title('filter low noised ramp and roof - sum mask'), grid()
subplot(2,2,2), plot(filterNoiseRRLowDiff), title('filter low noised ramp and roof - difference mask'), grid()
subplot(2,2,3), plot(filterNoiseRRHighSum), title('filter high noised ramp and roof - sum mask'), grid()
subplot(2,2,4), plot(filterNoiseRRHighDiff), title('filter high noised ramp and roof - difference mask'), grid()
%
% initialize filters - noised step-edge %
filterNoiseSELowSum = conv(noiseSELow, maskSum);
filterNoiseSELowDiff = conv(noiseSELow, maskDiff);
filterNoiseSEHighSum = conv(noiseSEHigh, maskSum);
filterNoiseSEHighDiff = conv(noiseSEHigh, maskDiff);
%
% visualize filters %
figure;
subplot(2,2,1), plot(filterNoiseSELowSum), title('filter low noised step edge - sum mask'), grid()
subplot(2,2,2), plot(filterNoiseSELowDiff), title('filter low noised step edge - difference mask'), grid()
subplot(2,2,3), plot(filterNoiseSEHighSum), title('filter high noised step edge - sum mask'), grid()
subplot(2,2,4), plot(filterNoiseSEHighDiff), title('filter high noised step edge - difference mask'),grid()

