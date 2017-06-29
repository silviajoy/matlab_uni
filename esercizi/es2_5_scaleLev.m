%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script to see results of thresholding on an image.
%
% Silvia Gioia Florio, matr. 119328
% Esercizio 2.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% artificial input scale %%
% initialization
% input scale
inputScale = 0:1/255:1;
% parameters
r = [0.4, 0.6];
s = [0,1,0];
% apply transform
outputScale = thresholding(inputScale, r, s);
%
% plot dependency
figure;
plot(inputScale,outputScale,'r')
title('Isolating values between .4 and .6')
%
%% using moon.tif as input scale %%
% initialization
img = imread('moon.tif');
img = double(img)/255;
% apply transform
out = thresholding(img,r,s);
%
% display result
figure;
subplot(2,2,1), imshow(img), title('Original image')
subplot(2,2,3), imhist(img), grid
subplot(2,2,2), imshow(out), title('Isolating values between .4 and .6')
subplot(2,2,4), imhist(out), grid
%
%% changing values in r %%
% initialization
rs = [[0 .2]; [.2 .4]; [.4 .6]; [.6 .8]; [.8 1]];
length = size(rs);
length = length(1);
outs = zeros(537,358,5);
%
% apply transform
for i=1:length
    r1 = rs(i,1);
    r2 = rs(i,2);
    outs(:,:,i) = thresholding(img,[r1,r2],s);
end
%
% display results
figure;
for i=1:length 
    subplot(2,5,i), imshow(outs(:,:,i)), 
    if i~=5
        title(sprintf('values between .%d and .%d', 2*i-2, 2*i))
    else
        title(sprintf('values between .%d and 1.', 2*i-2))
    end
    subplot(2,5,5+i), imhist(outs(:,:,i)), grid
end
%
%% playing with values of r and s %%
% isolating more than one band %
% ends
rMore1 = [.2 .8];
sMore1 = [1 0 1];
imgMore1 = thresholding(img, rMore1, sMore1);
% 2 bands
rMore2 = [.2 .3 .7 .8];
sMore2 = [0 1 0 1 0];
imgMore2 = thresholding(img, rMore2, sMore2);
% 
% display results
figure
subplot(2,2,1), imshow(imgMore1), title('ends isolated')
subplot(2,2,3), imhist(imgMore1), grid
subplot(2,2,2), imshow(imgMore2), title('Isolating btween .2 and .3 and between .7 and .8')
subplot(2,2,4), imhist(imgMore2), grid
% 
% set r and s to sample image in less grayscale bands %
% initialization
% 16 grayscale bands (4 bits) %
r4bits = 1/16:1/16:(1-1/16);
s4bits = 0:1/15:1;
img4bits = thresholding(img, r4bits, s4bits);
% 8 grayscale bands (3 bits) %
r3bits = 1/8:1/8:(1-1/8);
s3bits = 0:1/7:1;
img3bits = thresholding(img, r3bits, s3bits);
% 4 grayscale bands (2 bits) %
r2bits = 1/4:1/4:(1-1/4);
s2bits = 0:1/3:1;
img2bits = thresholding(img, r2bits, s2bits);
%
% display results
figure
subplot(2,4,1), imshow(img), title('Original Image')
subplot(2,4,5), imhist(img), grid
subplot(2,4,2), imshow(img4bits), title('16 bands - 4 bits')
subplot(2,4,6), imhist(img4bits), grid
subplot(2,4,3), imshow(img3bits), title('8 bands - 3 bits')
subplot(2,4,7), imhist(img3bits), grid
subplot(2,4,4), imshow(img2bits), title('4 bands - 2 bits')
subplot(2,4,8), imhist(img2bits), grid
% closer look to original and 4-bit images
figure
subplot(1,3,1), imshow(img), title('Original Image')
subplot(2,3,3), imhist(img), title('Original Image histogram'), grid
subplot(1,3,2), imshow(img4bits), title('16 bands - 4 bits')
subplot(2,3,6), imhist(img4bits), title('16 bands histogram'), grid



