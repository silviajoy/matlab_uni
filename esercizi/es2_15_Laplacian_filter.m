%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for visualizing effects of Laplacian
% filter.
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Excercise 2.15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sobel (and Roberts) edges amplitudes %%
% initialization %
% reading image
img = imread('blobs.png');
img = double(img);
% adding noise
noisy = sigNoise(img, 0.1);
% 
% calculate edges %
% function edge()
edgesSob = edge(noisy, 'sobel');
edgesSob = double(edgesSob);
edgesRob = edge(noisy, 'roberts');
edgesRob = double(edgesRob);

%
% display results %
% sobel 
figure
subplot(2,2,1), imshow(img, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,2,2), imshow(noisy, 'InitialMagnification', 'fit'), title('Image with noise')
subplot(2,2,3), imshow(edgesSob), title('Sobel edges amplitudes - edge()')
subplot(2,2,4), mesh(edgesSob), title('Sobel edges amplitudes - edge() mesh')
% roberts 
figure
subplot(2,2,1), imshow(img, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,2,2), imshow(noisy, 'InitialMagnification', 'fit'), title('Image with noise')
subplot(2,2,3), imshow(edgesRob), title('Roberts edges amplitudes - edge()')
subplot(2,2,4), mesh(edgesRob), title('Roberts edges amplitudes - edge() mesh')
%
% fspecial and imfilter %
% sobel %
% matrixes
sobX = fspecial('sobel');
sobY = transpose(sobX);
% apply 
blobsNoiseFSX = imfilter(noisy, sobX);
blobsNoiseFSY = imfilter(noisy, sobY);
% amplitudes
ampNSob = abs(blobsNoiseFSX) + abs(blobsNoiseFSY);
%
% roberts %
% matrixes
robX = [-1,0;0,1];
robY = [0,-1;1,0];
% apply
blobsNoiseFRX = imfilter(noisy,robX);
blobsNoiseFRY = imfilter(noisy,robY);
% amplitudes
ampNRob = abs(blobsNoiseFRX) + abs(blobsNoiseFRY);
% 
% display results %
% sobel
figure
subplot(2,2,1), imshow(img, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,2,2), imshow(noisy, 'InitialMagnification', 'fit'), title('Image with noise')
subplot(2,1,2), imshowpair(edgesSob, ampNSob, 'montage'), title('Sobel edges amplitudes maps - L: edge(), R:fspecial() and imfilter()')
% roberts
figure
subplot(2,2,1), imshow(img, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,2,2), imshow(noisy, 'InitialMagnification', 'fit'), title('Image with noise')
subplot(2,1,2), imshowpair(edgesRob, ampNRob, 'montage'), title('Roberts edges amplitudes maps - L: edge(), R:fspecial() and imfilter()')
%
% evaluation %
% calculate mse
mseSobEdge = immse(img, edgesSob);
mseSobFilter = immse(img, ampNSob);
mseRobEdge = immse(img, edgesRob);
mseRobFilter = immse(img, ampNRob);
% create table
% create rows
edge_function = [mseSobEdge; mseRobEdge];
fspecial_imfilter = [mseSobFilter; mseRobFilter];
table(edge_function, fspecial_imfilter, 'RowNames', {'Sobel', 'Roberts'})
%
%% Laplacian of Gaussian filter %%
% initialization %
% coins
coins = imread('coins.png');
coinsD = double(coins);
% mri
mri = imread('mri.tif');
mriD = double(mri);
% filtering
edgeCoins = edge(coinsD, 'log');
edgeMri = edge(mriD, 'log');
% 
% display results %
% coins
figure
subplot(1,2,1), imshow(coins), title('coins.png')
subplot(1,2,2), imshow(edgeCoins), title('Laplacian on coins.png')
% mri
figure
subplot(1,2,1), imshow(mri), title('mri.tif')
subplot(1,2,2), imshow(edgeMri), title('Laplacian on mri.tif')
%
%% Changing sigma parameter %%
% initialization %
sigma05 = 0.5;
sigma2 = 2.;
sigma3 = 3.;
%
% apply filter %
edgeMri05 = double(edge(mriD, 'log', [], sigma05));
edgeMri2 = double(edge(mriD, 'log', [], sigma2));
edgeMri3 = double(edge(mriD, 'log', [], sigma3));
%
% display results 
% sigma = 0.5
figure
subplot(2,2,1), imshow(mri), title('mri.tif')
subplot(2,2,2), imshow(edgeMri05), title('Laplacian with sigma = 0.5')
subplot(2,2,4), mesh(edgeMri05), title('Mesh')
% sigma = 2
figure
subplot(2,2,1), imshow(mri), title('mri.tif')
subplot(2,2,2), imshow(edgeMri2), title('Laplacian with sigma = 2')
subplot(2,2,4), mesh(edgeMri2), title('Mesh')
% sigma = 3
figure
subplot(2,2,1), imshow(mri), title('mri.tif')
subplot(2,2,2), imshow(edgeMri3), title('Laplacian with sigma = 3')
subplot(2,2,4), mesh(edgeMri3), title('Mesh')
