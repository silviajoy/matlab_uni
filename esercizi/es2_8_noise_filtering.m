%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for different noise filtering
%
% Silvia Gioia Florio, matr. 119328
% 04/04/2017 - Excercise 2.8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% add noise %%
% define initial checkerboard
img = double(checkerboard(32)>0.5);
%
% show checkerboard and relative histogram
figure; 
% checkerboard
subplot(3,2,1)
imshow(img);
title('checkerboard');
% histogram
subplot(3,2,2)
imhist(img)
grid()
title('checkerboard - histogram');
%
% initialize low and high noises
% low
low = imnoise (img, 'gaussian', 0.0, 0.1);
histLow = imhist(low);
% high
high = imnoise (img, 'gaussian', 0.0, 1);
histHigh = imhist(high);
%
% show noisy checkerboard and relative histogram
% low-noisy
subplot(3,2,3)
imshow(low);
title('noise low');
% low-noisy histogram
subplot(3,2,4)
imhist(low);
grid()
title('noise low - histogram');
% high-noisy
subplot(3,2,5)
imshow(high);
title('noise high');
% high-noisy histogram
subplot(3,2,6)
imhist(high);
grid()
title('noise high - histogram');
%
%% filtering %%
%
% filter the noisy checkerboards with average mask
filter = fspecial('average');
filteredLow = imfilter(low, filter);
filteredHigh = imfilter(high, filter);

% display differences
figure;
% low noisy filtered image and its histogram
% image
subplot(2,2,1)
imshow(filteredLow);
title('noise low - filtered');
% histogram
subplot(2,2,2)
imhist(filteredLow);
grid()
title('noise low - filtered: histogram');
% low noisy filtered image and its histogram
% image
subplot(2,2,3)
imshow(filteredHigh);
title('noise high - filtered');
% histogram
subplot(2,2,4)
imhist(filteredHigh);
grid()
title('noise high - filtered: histogram');
%
%% esteem %%
%
% initialization
mseNoiseLow = immse(img, low);
mseNoiseHigh = immse(img, high);

mseFilteredLow = immse(img, filteredLow);
mseFilteredHigh = immse(img, filteredHigh);

mseNoise = [mseNoiseLow; mseNoiseHigh]; 
mseFiltered = [mseFilteredLow; mseFilteredHigh];

table(mseNoise, mseFiltered)
%
%% masks Low Noise %%
%
% initialization
filter = fspecial('average', 5);
filteredLow5 = imfilter(low, filter);

figure;

subplot(2,2,1)
imshow(filteredLow5);
title('noise low - filtered 5x5');
subplot(2,2,2)
imhist(filteredLow5);
grid()
title('filtered 5x5: histogram');

filter = fspecial('average', 7);
filteredLow7 = imfilter(low, filter);

subplot(2,2,3)
imshow(filteredLow7);
title('noise low - filtered 7x7');
subplot(2,2,4)
imhist(filteredLow7);
grid()
title('filtered 7x7: histogram');
%
%% masks comparison %%
mse3x3Low = immse(img, filteredLow);
mse5x5Low = immse(img, filteredLow5);
mse7x7Low = immse(img, filteredLow7);

table(mse3x3Low, mse5x5Low, mse7x7Low)

%
%% masks high noise %%
%
% initialization
filter = fspecial('average', 5);
filteredHigh5 = imfilter(high, filter);

figure;

subplot(2,2,1)
imshow(filteredHigh5);
title('noise high - filtered 5x5');
subplot(2,2,2)
imhist(filteredHigh5);
grid()
title('filtered 5x5: histogram');

filter = fspecial('average', 7);
filteredHigh7 = imfilter(high, filter);

subplot(2,2,3)
imshow(filteredHigh7);
title('noise high - filtered 7x7');
subplot(2,2,4)
imhist(filteredHigh7);
grid()
title('filtered 7x7: histogram');
%
%% mask comparison %%

mse3x3High = immse(img, filteredHigh);
mse5x5High = immse(img, filteredHigh5);
mse7x7High = immse(img, filteredHigh7);

table(mse3x3High, mse5x5High, mse7x7High)
