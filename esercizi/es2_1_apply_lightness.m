%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for applying punctual operator for 
% lightness and contrast and for producing the
% negative of an image.
%
% Silvia Gioia Florio, matr. 119328
% @todo - Esercizio 2.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Punctual Operator: Lightness
%
% initialize image
img = imread('pout.tif');
% initialize lightness parameters
L1 = 30;
L2 = 60;
L3 = 90;
% apply operator
out1 = lightness(img, L1);
out2 = lightness(img, L2);
out3 = lightness(img, L3);
% display results
figure;
subplot(2,4,1);
imshow(img);
title('Original Image');
subplot(2,4,5);
imhist(img);
subplot(2,4,2);
imshow(out1);
title('L = 30');
subplot(2,4,6);
imhist(out1);
subplot(2,4,3);
imshow(out2);
title('L = 60');
subplot(2,4,7);
imhist(out2);
subplot(2,4,4);
imshow(out3);
title('L = 90');
subplot(2,4,8);
imhist(out3);
%
%% Punctual Operator: Contrast
%
% initialize image
img = imread('pout.tif');
% initialize contrast parameters
P1 = 0.5;
P2 = 1.5;
P3 = 2.;
% apply the operator
out4 = contrast(img, P1);
out5 = contrast(img, P2);
out6 = contrast(img, P3);
% display results
figure;
subplot(2,4,1);
imshow(img);
title('Original Image');
subplot(2,4,5);
imhist(img);
subplot(2,4,2);
imshow(out4);
title('P = 0.5');
subplot(2,4,6);
imhist(out4);
subplot(2,4,3);
imshow(out5);
title('P = 1.5');
subplot(2,4,7);
imhist(out5);
subplot(2,4,4);
imshow(out6);
title('P = 2');
subplot(2,4,8);
imhist(out6);
%% Negative of an image %%
%
% initialize image
img = imread('pout.tif');
% apply operator
out = negative(img);
% display result
figure
subplot(2,2,1)
imshow(img)
title('Original Image')
subplot(2,2,2)
imhist(img)
subplot(2,2,3)
imshow(out)
title('Negative Image')
subplot(2,2,4)
imhist(out)