%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script for understanding weight single bits
% in defining the color of an image
%
% Silvia Gioia Florio, matr. 119328
% Esercizio 2.7
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% intialization
% image
img = imread('cameraman.tif');
% outputs
len = size(img);
bits             = zeros(len(1,1), len(1,2), 8);
weigthedBits     = bits;
weigthedBitsNorm = bits;
diffBits         = bits;
diffBitsInt      = bits;
%
% calculations
for i=1:8
   % bitget
   bits(:,:,i) = bitget(img,i, 'uint8');
   % weighted bits
   weigthedBits(:,:,i) = bits(:,:,i) * 2^(i-1);
   % normalization
   weigthedBitsNorm(:,:,i) = weigthedBits(:,:,i) / 255;
   weigthedBitsNorm(:,:,i) = im2bw(weigthedBitsNorm(:,:,i), 0);
   % difference
   diffBits(:,:,i) = weigthedBitsNorm(:,:,i) - bits(:,:,i);
end
%
% display results
% bits 
figure
for i=1:8
    subplot(2,4,i), imshow(bits(:,:,i)), title(sprintf('%d* plan', i))
end
% weighted bits
figure
for i=1:8
    subplot(2,4,i), imshow(weigthedBits(:,:,i)), title(sprintf('%d* plan', i))
end
% difference
figure
for i=1:8
    subplot(2,4,i), imshow(diffBits(:,:,i)), title(sprintf('%d* plan', i))
end
%
%% return to the original %%
%
% initialization
% sum of bits plans
bitsSum = sum(weigthedBits, 3);
% difference between original and reconstructed
diffImg = double(img)-bitsSum;
%
% display results
figure(); 
subplot(2,3,1), imshow(img), title('Original Image')
subplot(2,3,4), imhist(img), grid
subplot(2,3,2), imshow(uint8(bitsSum)), title('Reconstructed Image')
subplot(2,3,5), imhist(uint8(bitsSum)), grid
subplot(2,3,3), imshow(uint8(diffImg)), title('Difference')
subplot(2,3,6), imhist(uint8(diffImg)), grid
%
%% partial reconstructions %%
%
% initialization
% 8th plan
img8 = weigthedBits(:,:,8);
img8 = uint8(img8);
mse8 = immse(img, img8);
% 8th and 7th plans
img78 = sum(weigthedBits(:,:,7:8), 3);
img78 = uint8(img78);
mse78 = immse(img, img78);
% 8th, 7th, 6th
img678 = sum(weigthedBits(:,:,6:8), 3);
img678 = uint8(img678);
mse678 = immse(img, img678);
% 8th, 7th, 6th and 5th
img5678 = sum(weigthedBits(:,:,5:8), 3);
img5678 = uint8(img5678);
mse5678 = immse(img, img5678);
%
% display results
% figure
figure
subplot(2,5,1), imshow(img), title('Original Image')
subplot(2,5,6), imhist(img), grid
subplot(2,5,2), imshow(img8), title('8th')
subplot(2,5,7), imhist(img8), grid
subplot(2,5,3), imshow(img78), title('8th and 7th')
subplot(2,5,8), imhist(img78), grid
subplot(2,5,4), imshow(img678), title('8th, 7th and 6th')
subplot(2,5,9), imhist(img678), grid
subplot(2,5,5), imshow(img5678), title('8th, 7th, 6th and 5th')
subplot(2,5,10), imhist(img5678), grid
% mse table
imgDescription = {'Piano 8';'Piani 7+8';'Piani 6+7+8';'Piani 5+6+7+8'};
imgMSE = [mse8;mse78;mse678;mse5678];
MSETable = table(imgDescription, imgMSE);
MSETable.Properties.VariableNames{'imgDescription'} = 'bit_plans';
MSETable.Properties.VariableNames{'imgMSE'} = 'mse';
MSETable

