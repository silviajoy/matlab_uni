%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for the analysis of directions of edges
% on Sobel and Roberts filters.
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Excercise 2.11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Roberts and Sobel filters %%
% initialize synthetic image %
% initialize black image
img = zeros(30,30);
% create a white rectangle
img(5:24, 13:17)=1.;
%
% initialize Roberts and Sobert matrixes %
% roberts
robX = [-1,0;0,1];
robY = [0,-1;1,0];
% sobel 
sobX = fspecial('sobel');
sobY = transpose(sobX);
% apply filters %
% roberts
imgFRX = imfilter(img,robX);
imgFRY = imfilter(img,robY);
% sobel
imgFSX = imfilter(img, sobX);
imgFSY = imfilter(img, sobY);
%
% display results %
% roberts
figure
subplot(2,3,1), imshow(img), title('Original Image')
subplot(2,3,2), imshow(imgFRY, 'InitialMagnification', 'fit'), title('Roberts Filter First Derivative')
subplot(2,3,3), imshow(imgFRX, 'InitialMagnification', 'fit'), title('Roberts Filter Second Derivative')
subplot(2,3,5), mesh(imgFRY), title('Roberts First Derivative Mesh')
subplot(2,3,6), mesh(imgFRX), title('Roberts Second Derivative Mesh')
%sobel
figure
subplot(2,3,1), imshow(img), title('Original Image')
subplot(2,3,2), imshow(imgFSX, 'InitialMagnification', 'fit'), title('Sobel Filter First Derivative')
subplot(2,3,3), imshow(imgFSY, 'InitialMagnification', 'fit'), title('Sobel Filter Second Derivative')
subplot(2,3,5), mesh(imgFSX), title('Sobel First Derivative Mesh')
subplot(2,3,6), mesh(imgFSY), title('Sobel Second Derivative Mesh')
%
% amplitudes and directions map %
% roberts
ampRob = abs(imgFRX) + abs(imgFRY);
% sobel
ampSob = abs(imgFSX) + abs(imgFSY);
%
% display result %
figure
subplot(1,3,1), imshow(ampRob), title('Roberts Amplitudes Map')
subplot(1,3,2), mesh(ampRob), title('Roberts Amplitudes Map Mesh')
subplot(1,3,3), quiver(imgFRX, imgFRY), title('Roberts Directions Map')
figure
subplot(1,3,1), imshow(ampSob), title('Sobel Amplitudes Map')
subplot(1,3,2), mesh(ampSob), title('Sobel Amplitudes Map Mesh')
subplot(1,3,3), quiver(imgFSX, imgFSY), title('Sobel Directions Map')
%
%% experiment %%
% diagonal figure %
imgDia = zeros(30,30);
for i=5:20 
    for j=0:5
        imgDia(i+j, i+1) = 1;
    end
end
%
% apply filters %
% roberts
imgDiaFRX = imfilter(imgDia,robX);
imgDiaFRY = imfilter(imgDia,robY);
% sobel
imgDiaFSX = imfilter(imgDia, sobX);
imgDiaFSY = imfilter(imgDia, sobY);
%
% display results %
% roberts
figure
subplot(2,3,1), imshow(imgDia), title('Original Image')
subplot(2,3,2), imshow(imgDiaFRY, 'InitialMagnification', 'fit'), title('Roberts Filter First Derivative')
subplot(2,3,3), imshow(imgDiaFRX, 'InitialMagnification', 'fit'), title('Roberts Filter Second Derivative')
subplot(2,3,5), mesh(imgDiaFRY), title('Roberts First Derivative Mesh')
subplot(2,3,6), mesh(imgDiaFRX), title('Roberts Second Derivative Mesh')
%sobel
figure
subplot(2,3,1), imshow(imgDia), title('Original Image')
subplot(2,3,2), imshow(imgDiaFSX, 'InitialMagnification', 'fit'), title('Sobel Filter First Derivative')
subplot(2,3,3), imshow(imgDiaFSY, 'InitialMagnification', 'fit'), title('Sobel Filter Second Derivative')
subplot(2,3,5), mesh(imgDiaFSX), title('Sobel First Derivative Mesh')
subplot(2,3,6), mesh(imgDiaFSY), title('Sobel Second Derivative Mesh')
%
% amplitudes and directions map %
% roberts
ampRobDia = abs(imgDiaFRX) + abs(imgDiaFRY);
% sobel
ampSobDia = abs(imgDiaFSX) + abs(imgDiaFSY);
%
% display result %
figure
subplot(1,3,1), imshow(ampRobDia), title('Roberts Amplitudes Map')
subplot(1,3,2), mesh(ampRobDia), title('Roberts Amplitudes Map Mesh')
subplot(1,3,3), quiver(imgDiaFRX, imgDiaFRY), title('Roberts Directions Map')
figure
subplot(1,3,1), imshow(ampSobDia), title('Sobel Amplitudes Map')
subplot(1,3,2), mesh(ampSobDia), title('Sobel Amplitudes Map Mesh')
subplot(1,3,3), quiver(imgDiaFSX, imgDiaFSY), title('Sobel Directions Map')
%
%% noisy bar %%
% initialization %
imgNoise = sigNoise(img, 0.1);
% apply filters %
% roberts
imgNFRX = imfilter(imgNoise,robX);
imgNFRY = imfilter(imgNoise,robY);
% sobel
imgNFSX = imfilter(imgNoise, sobX);
imgNFSY = imfilter(imgNoise, sobY);
%
% display results %
% roberts
figure
subplot(2,3,1), imshow(imgNoise), title('Noisy Image')
subplot(2,3,2), imshow(imgNFRY, 'InitialMagnification', 'fit'), title('Roberts Filter First Derivative')
subplot(2,3,3), imshow(imgNFRX, 'InitialMagnification', 'fit'), title('Roberts Filter Second Derivative')
subplot(2,3,5), mesh(imgNFRY), title('Roberts First Derivative Mesh')
subplot(2,3,6), mesh(imgNFRX), title('Roberts Second Derivative Mesh')
%sobel
figure
subplot(2,3,1), imshow(imgNoise), title('Noisy Image')
subplot(2,3,2), imshow(imgNFSX, 'InitialMagnification', 'fit'), title('Sobel Filter First Derivative')
subplot(2,3,3), imshow(imgNFSY, 'InitialMagnification', 'fit'), title('Sobel Filter Second Derivative')
subplot(2,3,5), mesh(imgNFSX), title('Sobel First Derivative Mesh')
subplot(2,3,6), mesh(imgNFSY), title('Sobel Second Derivative Mesh')
%
% amplitudes and directions map %
% roberts
ampNRob = abs(imgNFRX) + abs(imgNFRY);
% sobel
ampNSob = abs(imgNFSX) + abs(imgNFSY);
%
% display result %
figure
subplot(1,3,1), imshow(ampNRob), title('Roberts Amplitudes Map')
subplot(1,3,2), mesh(ampNRob), title('Roberts Amplitudes Map Mesh')
subplot(1,3,3), quiver(imgNFRX, imgNFRY), title('Roberts Directions Map')
figure
subplot(1,3,1), imshow(ampNSob), title('Sobel Amplitudes Map')
subplot(1,3,2), mesh(ampNSob), title('Sobel Amplitudes Map Mesh')
subplot(1,3,3), quiver(imgNFSX, imgNFSY), title('Sobel Directions Map')
%
%% blobs %%
% initialization %
blobs = imread('blobs.png');
blobsNoise = sigNoise(blobs, 0.1);
% apply filters %
% roberts
blobsNoiseFRX = imfilter(blobsNoise,robX);
blobsNoiseFRY = imfilter(blobsNoise,robY);
% sobel
blobsNoiseFSX = imfilter(blobsNoise, sobX);
blobsNoiseFSY = imfilter(blobsNoise, sobY);
%
% amplitudes and directions map %
% roberts
ampNRob = abs(blobsNoiseFRX) + abs(blobsNoiseFRY);
% sobel
ampNSob = abs(blobsNoiseFSX) + abs(blobsNoiseFSY);
%
% display result %
figure
subplot(2,3,1), imshow(blobs, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,3,4), imshow(blobsNoise, 'InitialMagnification', 'fit'), title('Noisy Image')
subplot(2,3,2), imshow(ampNRob), title('Roberts Amplitudes Map')
subplot(2,3,5), mesh(ampNRob), title('Roberts Amplitudes Map Mesh')
subplot(2,3,3), imshow(ampNSob), title('Sobel Amplitudes Map')
subplot(2,3,6), mesh(ampNSob), title('Sobel Amplitudes Map Mesh')
%
%% circuit %%
circuit = imread('circuit.tif');
% apply filters %
% roberts
circuitFRX = imfilter(circuit,robX);
circuitFRY = imfilter(circuit,robY);
% sobel
circuitFSX = imfilter(circuit, sobX);
circuitFSY = imfilter(circuit, sobY);
%
% amplitudes and directions map %
% roberts
ampRobCircuit = abs(circuitFRX) + abs(circuitFRY);
% sobel
ampSobCircuit = abs(circuitFSX) + abs(circuitFSY);
%
% display result %
figure
subplot(2,2,1), imshow(circuit, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,2,2), imshow(ampRobCircuit), title('Roberts Amplitudes Map')
subplot(2,2,4), mesh(ampRobCircuit), title('Roberts Amplitudes Map Mesh')
subplot(2,2,3), quiver(circuitFRX, circuitFRY), title('Roberts Directions Map')
figure
subplot(2,2,1), imshow(circuit, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,2,2), imshow(ampSobCircuit), title('Sobel Amplitudes Map')
subplot(2,2,4), mesh(ampSobCircuit), title('Sobel Amplitudes Map Mesh')
subplot(2,2,3), quiver(circuitFSX, circuitFSY), title('Sobel Directions Map')
%
% focus on directions maps %
figure 
subplot(1,2,1), quiver(circuitFRX, circuitFRY), title('Roberts Directions Map')
subplot(1,2,2), quiver(circuitFSX, circuitFSY), title('Sobel Directions Map')
%
%% binarization %%
% display amplitudes maps %
figure
subplot(2,3,1), imshow(circuit, 'InitialMagnification', 'fit'), title('Original Image')
subplot(2,3,2), imshow(ampRobCircuit), title('Roberts Amplitudes Map')
subplot(2,3,5), mesh(ampRobCircuit), title('Roberts Amplitudes Map Mesh')
subplot(2,3,3), imshow(ampSobCircuit), title('Sobel Amplitudes Map')
subplot(2,3,6), mesh(ampSobCircuit), title('Sobel Amplitudes Map Mesh')
% 
% binarization %
ampRobBin = im2bw(ampRobCircuit, .12);
ampSobBin = im2bw(ampSobCircuit,.4);
%
% display results %
figure
subplot(2,1,1), imshowpair(ampRobCircuit, ampRobBin, 'montage'), title(sprintf('Roberts Aplitudes Maps\nThreshold 0.12'))
subplot(2,1,2), imshowpair(ampSobCircuit, ampSobBin, 'montage'), title(sprintf('Sobel Aplitudes Maps\nThreshold 0.4'))
