%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for [..@todo].
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Esercizio 2.16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%
%%%% synthetic image with three white points %%%%
%%%
%% Initialize Image %%
% initialize black image
img = zeros(50,50);
% set three single points to white
img(25,30) = 1.;
img(34,12) = 1.;
img(3,21) = 1.;
% display result
imshow(img, 'InitialMagnification', 'fit');
title('Three White Points');

%% Laplace filter %%
% initialize filter
lap = fspecial('laplacian');
% filtering image
filteredImage = imfilter(img,lap);
% display results
figure;
subplot(2,2,1);
imshow(img);
title('Original Image');
subplot(2,2,2);
mesh(img);
title('Original Mesh');
grid();
subplot(2,2,3);
imshow(filteredImage);
title('Filtered Image');
subplot(2,2,4);
mesh(filteredImage);
title('Filtered Mesh');
grid();

%% Inversion and negative removal %%
% inversion
negativeFilteredImage = filteredImage*(-1);
% negativeRemoval
negativeRemoved = im2bw(negativeFilteredImage, 0);
% display results
figure;
subplot(3,2,1);
imshow(img);
title('Original Image');
subplot(3,2,2);
mesh(img);
title('Original Mesh');
grid();
subplot(3,2,3);
imshow(filteredImage);
title('Filtered Image');
subplot(3,2,4);
mesh(filteredImage);
title('Filtered Mesh');
grid();
subplot(3,2,5);
imshow(negativeRemoved);
title('Invert and Negative Removal Image');
subplot(3,2,6);
mesh(double(negativeRemoved));
title('Invert and Negative Removal Mesh');
grid();
