%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script to see the effects of opacity mask on 
% an image with different values as alfa
%
% Silvia Gioia Florio, matr. 119328
% Excercise 2.3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% initialize images %%
% read image moon.tif
img = imread('moon.tif');
% read eight.tif as mask
mask = imread('eight.tif');
% resize mask to fit image
sizes = size(img);
mask = imresize(mask,sizes);

%% display image and mask %%
figure
subplot(2,2,1);
imshow(img);
title('moon')
subplot(2,2,3);
imhist(img);
grid()

subplot(2,2,2)
imshow(mask)
title('eight (resized)')
subplot(2,2,4)
imhist(mask)
grid()

%% initialize opacity values %%
alfaNull = 0.;
alfaLow = 0.25;
alfaMed = 0.5;
alfaHigh = 0.75;
alfaFull = 1;

%% apply opacity mask %%
outNull = opacityMask(img,mask,alfaNull);
outLow = opacityMask(img,mask,alfaLow);
outMed = opacityMask(img,mask,alfaMed);
outHigh = opacityMask(img,mask,alfaHigh);
outFull = opacityMask(img,mask,alfaFull);

%% display results %%
figure
subplot(2,5,1)
imshow(outNull)
title('alpha = 0.')
subplot(2,5,6)
imhist(outNull)
grid()

subplot(2,5,2)
imshow(outLow)
title('alpha = 0.25')
subplot(2,5,7)
imhist(outLow)
grid()

subplot(2,5,3)
imshow(outMed)
title('alpha = 0.5')
subplot(2,5,8)
imhist(outMed)
grid()

subplot(2,5,4)
imshow(outHigh)
title('alpha = 0.75')
subplot(2,5,9)
imhist(outHigh)
grid()

subplot(2,5,5)
imshow(outFull)
title('alpha = 1')
subplot(2,5,10)
imhist(outFull)
grid()

%% concatenate output images %%
% concatenate
concat = cat(2, outNull, outLow, outMed, outHigh, outFull);
% display result
figure
imshow(concat);
title('5 opacity masks concatenated');

%% flip the image of the moon %%
% flip around X axis
flippedMoonX = flip(img);
% flip around Y axis
flippedMoonY = flip(img,2);
% flip around X and Y axis
flippedMoonXY = flip(flippedMoonX,2);
% create concatenated outpur images
% diamond
firstCol = cat(1, img, flippedMoonX);
secondCol = cat(1, flippedMoonY, flippedMoonXY);
diamond = cat(2, firstCol, secondCol);
% hourglass
firstCol = cat(1, flippedMoonX, img);
secondCol = cat(1, flippedMoonXY, flippedMoonY);
hourglass = cat(2, firstCol, secondCol);
% display results
figure
subplot(1,2,1);
imshow(diamond);
title('moon diamond');
subplot(1,2,2);
imshow(hourglass);
title('moon hourglass');





