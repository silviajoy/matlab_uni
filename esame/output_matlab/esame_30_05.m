%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for analyzing different threshold values
% in Sobel and Roberts filters. 
%
% Silvia Gioia Florio, matr. 119328
% 30/05/2017 - Exam
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Cameraman %%
img = imread('cameraman.tif');
imgDouble = double(img)/255;
% 
% display image and histogram %
% image
subplot(1,2,1), imshow(imgDouble), title('cameraman.tif')
subplot(1,2,2), imhist(imgDouble), title('grey level histogram'), grid
%
%% Roberts and Sobel filters %%
% initialize Roberts and Sobert matrixes %
% roberts
robX = [-1,0;0,1];
robY = [0,-1;1,0];
% sobel 
sobX = fspecial('sobel');
sobY = transpose(sobX);
% apply filters %
% roberts
imgFRX = imfilter(imgDouble,robX);
imgFRY = imfilter(imgDouble,robY);
% sobel
imgFSX = imfilter(imgDouble, sobX);
imgFSY = imfilter(imgDouble, sobY);
%
% amplitudes and directions map %
% roberts
ampRob = abs(imgFRX) + abs(imgFRY);
% sobel
ampSob = abs(imgFSX) + abs(imgFSY);
%
% display results %
figure
% roberts
subplot(2,2,1), imshow(ampRob), title('Roberts Amplitudes Map')
subplot(2,2,2), imhist(ampRob), title('Roberts Amplitudes Map Histogram'), grid
% sobel
subplot(2,2,3), imshow(ampSob), title('Sobel Amplitudes Map')
subplot(2,2,4), imhist(ampSob), title('Sobel Amplitudes Map Histogram'), grid
%
%% binarization %%
% initialization %
% roberts
% threshold 0.05
ampRobBW05 = double(im2bw(ampRob, 0.05));
% threshold 0.15
ampRobBW15 = double(im2bw(ampRob, 0.15));
% threshold 0.3
ampRobBW3 = double(im2bw(ampRob, 0.3));
%
% sobel
% threshold 0.05
ampSobBW05 = double(im2bw(ampSob, 0.05));
% threshold 0.15
ampSobBW15 = double(im2bw(ampSob, 0.15));
% threshold 0.3
ampSobBW3 = double(im2bw(ampSob, 0.3));
%
% concatenation %
% roberts
concatRob = cat(2, ampRob, ampRobBW05, ampRobBW15, ampRobBW3);
% sobel
concatSob =  cat(2, ampSob, ampSobBW05, ampSobBW15, ampSobBW3);
% display results %
figure 
% roberts
subplot(2,1,1), imshow(concatRob), title('Roberts amplitudes map binarization: thresholds .05, .15, .3')
% sobel
subplot(2,1,2), imshow(concatSob), title('Sobel amplitudes map binarization: thresholds .05, .15, .3')
%
%% Canny filter %%
% initialization %
ampCan = double(edge(imgDouble, 'canny'));
optRob = ampRobBW3; % optimal roberts
optSob = ampSobBW3; % optimal sobel
%
% display results %
figure
% original image
subplot(2,2,1), imshow(imgDouble), title('"cameraman.tif"')
% canny amplitudes
subplot(2,2,2), imshow(ampCan), title('Canny Amplitudes Map')
% roberts amplitudes
subplot(2,2,3), imshow(optRob), title('Roberts Amplitudes Map - Threshold 0.3')
% sobel amplitudes
subplot(2,2,4), imshow(optSob), title('Sobel Amplitudes Map - Threshold 0.3')
%
%% mse %%
% itialization %
reference = ampCan;
%
% mse esteem %
% roberts
mseRob = immse(ampCan, optRob);
% sobel 
mseSob = immse(ampCan, optSob);
% both
mses = [mseRob, mseSob];
%
% create table %
colnames = {'mse Roberts', 'mse Sobel'};
% display
figure
uitable('Data', mses, 'ColumnName', colnames, 'Position', [110 160 335 100]);
