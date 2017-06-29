%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script to apply stretching on the istogram of
% an image to increase contrast
%
% Silvia Gioia Florio, matr. 119328
% Excercise 2.4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% initialize images %%
% read image pout.tif
img = imread('pout.tif');
% apply transform
stretched = stretch(img);
% display images 
figure
subplot(2,2,1);
imshow(img);
title('pout')
subplot(2,2,3);
imhist(img);
grid()

subplot(2,2,2)
imshow(stretched)
title('pout (stretched)')
subplot(2,2,4)
imhist(stretched)
grid()

%% output scale and input scale dependency %%
img = double(img);
% initialize parameters
kmax = max(max(img));
fmin = min(min(img));
% input scale
inputScale  = fmin:1.0:kmax;
% output scale
outputScale = (kmax / (kmax - fmin)) * (inputSc - fmin);
% display results
figure
plot(inputScale, outputScale)
xlabel('Input Scale'), ylabel('Output Scale')
title('Input and Output scales mapping'), grid









