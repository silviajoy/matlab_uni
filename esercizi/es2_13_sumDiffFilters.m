%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Segmentazione analysis of sum and differences filters response to 
% one-dimensional intensity profiles
%
% Florio Silvia, mat. 119328
% 27-04-17, excercise 2.13
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% intensity profiles %%
% initialization
nsample = 100;
% ramp and roof profile
seqRR = [0 0 0 4 8 12 0 0 0 12 0 0 0];
sigRR = IntProfile(seqRR, nsample);
% step edge profile
seqS = [0 0 4 4 0 0 0 8 8 0 0 0];
sigS = IntProfile(seqS, nsample);
%
% noisy profiles %
% ramp and roof
sigRRLow = sigNoise(sigRR,  0.01);
sigRRHigh = sigNoise(sigRR, 0.2);
% step edge
sigSLow  = sigNoise(sigS,   0.01);
sigSHigh  = sigNoise(sigS,  0.2);
%
% unidimensional filters initialization
maskSum = [1  1];
maskDiff = [1 -1];
%
% filtering %
% ramp and roof
sigRRSum = conv(sigRR, maskSum);
sigRRDiff = conv(sigRR, maskDiff);
% sstep edge
sigSSum  = conv(sigS,  maskSum);
sigSDiff  = conv(sigS,  maskDiff);
%
% display results %
figure
% ramp and roof
subplot(2,3,1), plot(sigRR), grid, title('ramp and roof')
subplot(2,3,2), plot(sigRRSum), grid, title('ramp and roof - sum filter')
subplot(2,3,3), plot(sigRRDiff), grid, title('ramp and roof - difference filter')
% step edge
subplot(2,3,4), plot(sigS), grid, title('step edge')
subplot(2,3,5), plot(sigSSum), grid, title('step edge - sum filter')
subplot(2,3,6), plot(sigSDiff), grid, title('step edge - difference filter')

%
%% filtering noisy profiles %%
% ramp and roof
sigRRLowSum = conv(sigRRLow, maskSum);
sigRRHighSum = conv(sigRRHigh, maskSum);
sigRRLowDiff = conv(sigRRLow, maskDiff);
sigRRHighDiff = conv(sigRRHigh, maskDiff);
% step edge
sigSLowSum  = conv(sigSLow,  maskSum);
sigSHighSum  = conv(sigSHigh,  maskSum);
sigSLowDiff  = conv(sigSLow,  maskDiff);
sigSHighDiff  = conv(sigSHigh,  maskDiff);
%
% display results %
% ramp and roof low noise
figure
subplot(2,3,1), plot(sigRR), grid, title(sprintf('ramp and roof - no noise'))
subplot(2,3,2), plot(sigRRSum), grid, title(sprintf('ramp and roof - no noise\nsum filter'))
subplot(2,3,3), plot(sigRRDiff), grid, title(sprintf('ramp and roof - no noise\ndifference filter'))
subplot(2,3,4), plot(sigRRLow), grid, title(sprintf('ramp and roof - low noise'))
subplot(2,3,5), plot(sigRRLowSum), grid, title(sprintf('ramp and roof - low noise\nsum filter'))
subplot(2,3,6), plot(sigRRLowDiff), grid, title(sprintf('ramp and roof - low noise\ndifference filter'))
% ramp and roof high noise
figure
subplot(2,3,1), plot(sigRR), grid, title(sprintf('ramp and roof - no noise'))
subplot(2,3,2), plot(sigRRSum), grid, title(sprintf('ramp and roof - no noise\nsum filter'))
subplot(2,3,3), plot(sigRRDiff), grid, title(sprintf('ramp and roof - no noise\ndifference filter'))
subplot(2,3,4), plot(sigRRHigh), grid, title(sprintf('ramp and roof - high noise'))
subplot(2,3,5), plot(sigRRHighSum), grid, title(sprintf('ramp and roof - high noise\nsum filter'))
subplot(2,3,6), plot(sigRRHighDiff), grid, title(sprintf('ramp and roof - high noise\ndifference filter'))
% step edge
figure
subplot(2,3,1), plot(sigS), grid, title(sprintf('step edge - no noise'))
subplot(2,3,2), plot(sigSSum), grid, title(sprintf('step edge - no noise\nsum filter'))
subplot(2,3,3), plot(sigSDiff), grid, title(sprintf('step edge - no noise\ndifference filter'))
subplot(2,3,4), plot(sigSLow), grid, title(sprintf('step edge - low noise'))
subplot(2,3,5), plot(sigSLowSum), grid, title(sprintf('step edge - low noise\nsum filter'))
subplot(2,3,6), plot(sigSLowDiff), grid, title(sprintf('step edge - low noise\ndifference filter'))

figure
subplot(2,3,1), plot(sigS), grid, title(sprintf('step edge - no noise'))
subplot(2,3,2), plot(sigSSum), grid, title(sprintf('step edge - no noise\nsum filter'))
subplot(2,3,3), plot(sigSDiff), grid, title(sprintf('step edge - no noise\ndifference filter'))
subplot(2,3,4), plot(sigSHigh), grid, title(sprintf('step edge - high noise'))
subplot(2,3,5), plot(sigSHighSum), grid, title(sprintf('step edge - high noise\nsum filter'))
subplot(2,3,6), plot(sigSHighDiff), grid, title(sprintf('step edge - high noise\ndifference filter'))

%
%% double difference filtering %%
% no noise %
sigRRDoubleDiff = conv(sigRRDiff, maskDiff); 
sigSDoubleDiff  = conv(sigSDiff,  maskDiff); 
%
% display results %
figure
% ramp and roof
subplot(2,2,1), plot(sigRR), grid, title(sprintf('ramp and roof - no noise'))
subplot(2,2,2), plot(sigRRDoubleDiff), grid, title(sprintf('ramp and roof - no noise\ndouble difference filter'))
% step edge
subplot(2,2,3), plot(sigS), grid, title(sprintf('step edge - no noise'))
subplot(2,2,4), plot(sigSDoubleDiff), grid, title(sprintf('step edge - no noise\ndouble difference filter'))
%
% noisy profiles %
% ramp and roof
sigRRLowDoubleDiff = conv(sigRRLowDiff, maskDiff); 
sigRRHighDoubleDiff = conv(sigRRHighDiff, maskDiff);
% step edge
sigSLowDoubleDiff  = conv(sigSLowDiff,  maskDiff); 
sigSHighDoubleDiff  = conv(sigSHighDiff,  maskDiff);
% 
% display results %
figure
% ramp and roof
subplot(2,2,1), plot(sigRRLowDoubleDiff), grid, title(sprintf('ramp and roof - low noise\ndouble difference filter'))
subplot(2,2,2), plot(sigRRHighDoubleDiff), grid, title(sprintf('ramp and roof - high noise\ndouble difference filter'))
% step edge
subplot(2,2,3), plot(sigSLowDoubleDiff), grid, title(sprintf('step edge - low noise\ndouble difference filter'))
subplot(2,2,4), plot(sigSHighDoubleDiff), grid, title(sprintf('step edge - high noise\ndouble difference filter'))

