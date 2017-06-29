%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for the analasys of low-pass filters
% on the Synthetic NOISELESS image checkerboard
%
% Florio Silvia Gioia - April 6, 2017 - exercise 16-17 - not a homework
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%	Define the checkerboard image with default parameters
img=checkerboard>0.5;
imshow(img,'InitialMagnification','fit')
%
%	Prior to any filtering: change image format in double
img=double(img);
%
%   Visualize the 'average' filter masks: 3, 7, 11
figure
aver3=fspecial('average',3);
subplot(2,3,1)
mesh(aver3)
%
aver7=fspecial('average',7);
subplot(2,3,2)
mesh(aver7)
%
aver11=fspecial('average',11);
subplot(2,3,3)
mesh(aver11)
%
%   Filter the checkerboard
% with the average masks
imgF3=imfilter(img, aver3);
subplot(2,3,4)
imshow(imgF3)
%
imgF7=imfilter(img, aver7);
subplot(2,3,5)
imshow(imgF7)
%
imgF11=imfilter(img, aver11);
subplot(2,3,6)
imshow(imgF11)
%
%   Switch to the gaussian filter
%   Gaussian masks: 3, 15, 23
%   Standard deviation is 0.5 in any case
figure
gauss3=fspecial('gaussian',3, 1);
subplot(2,3,1)
mesh(gauss3)
gauss15=fspecial('gaussian',15, 1);
subplot(2,3,2)
mesh(gauss15)
gauss23=fspecial('gaussian',23, 1);
subplot(2,3,3)
mesh(gauss23)
%
%
imgFG3= imfilter(img,gauss3);
subplot(2,3,4)
imshow(imgFG3)
imgFG15= imfilter(img,gauss15);
subplot(2,3,5)
imshow(imgFG15)
imgFG23= imfilter(img,gauss23);
subplot(2,3,6)
imshow(imgFG23)
