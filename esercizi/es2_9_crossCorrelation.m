%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for understanding cross correlation
% effects
%
% Silvia Gioia Florio, matr. 119328
% 04/04/2017 - Excercise 2.9
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% crop
%
% initialization
img = imread('text.png');
crop = imcrop(img, [29 11 12 12]);
%
% display result
figure;
subplot(1,2,1), imshow(img), title('text.png')
subplot(1,2,2), imshow(crop), title('cropped "e"')

%% cross correlation
%
% calculate correlation
res = normxcorr2(crop,img);
%
% display results
figure
%image
subplot(1,3,1), imshow(res), title('image after correlation'),
%histogram
subplot(1,3,2), imhist(res), title('histogram'), grid
%3d representation
subplot(1,3,3), surf(res), title('3d colored surface')

%%  Thresholding %%
bwres = im2bw(res,0.8);
%
% display results
figure
%image
imshow(bwres, 'InitialMagnification', 'fit'), title('image after correlation, sliced at .8')


