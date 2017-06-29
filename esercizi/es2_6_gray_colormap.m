%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for turn an image into grayscale and see
% the effects using colormaps
%
% Silvia Gioia Florio, matr. 119328
% Esercizio 2.6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% West Concord %%
%
% initialize image
img = imread('westconcordaerial.png');
%
% display image
figure
imshow(img,'InitialMagnification', 'fit'), title('West Concord aerial')
%
%% convert image to grayscale  %%
gray = rgb2gray(img);
%
% display grayscale image and its histogram 
figure;
subplot(1,2,1), imshow(gray), title('grayscale image')
subplot(1,2,2), imhist(gray), title('grayscale image histogram'), grid;
%
%% divide in 16 gray levels %%
sliced = grayslice(gray, 16);
%
% display result 
figure
imshow(sliced, jet(16)), colorbar, title('West Concord aerial - colormap jet')
%
%% Cervignano map %%
%
% initialize image
imgC = imread('cervignano-aerial.png');
%
% display image 
figure
imshow(imgC,'InitialMagnification', 'fit')
title('Cervignano aerial')
%
%% convert image to grayscale %%
grayC = rgb2gray(imgC);
%
% display grayscale image and its histogram
figure;
subplot(1,2,1), imshow(grayC), title('grayscale image')
subplot(1,2,2), imhist(grayC), title('grayscale image histogram'), grid;
%
%% divide in 3 gray levels %%
slicedC = grayslice(grayC, 3);
%
% display result
figure
imshow(slicedC, pink(3)), colorbar, title('Dark red zones are parks and green zones of the area');
