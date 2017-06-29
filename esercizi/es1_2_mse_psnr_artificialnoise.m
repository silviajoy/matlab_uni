%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script to create artificial noise on an artificial image
% and then calculate Mean Square Error, Peek Signal to
% Noise Ratio and Signal to Noise Ratio
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Excercise 1.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% initialize synthetic image
% initialize black image
img = zeros(30,30);
% create a white rectangle
img(5:24, 13:17)=1.;


%% adding noise %%
% 0.01 variance noise
imgLowVar = imnoise (img, 'gaussian', 0, 0.01);

% 0.1 variance noise
imgMedVar = imnoise (img, 'gaussian', 0, 0.1);

% 1 variance noise
imgHighVar = imnoise (img, 'gaussian', 0, 1.);


%% Displaying images %%
figure
% original image
subplot(2,2,1), imshow(img)
title('original')
% 0.01 variance
subplot(2,2,2), imshow(imgLowVar)
title('Variance 0.01')
% 0.1 variance
subplot(2,2,3), imshow(imgMedVar)
title('Variance 0.1')
% 1 variance
subplot(2,2,4), imshow(imgHighVar)
title('Variance 1')


%% Calculating mse, psnr and snr %%
% mse
mseLowVar = immse(img, imgLowVar);
mseMedVar = immse(img, imgMedVar);
mseHighVar = immse(img, imgHighVar);

% psnr
[psnrLowVar, snrLowVar] = psnr(img, imgLowVar);
[psnrMedVar, snrMedVar] = psnr(img, imgMedVar);
[psnrHighVar, snrHighVar] = psnr(img, imgHighVar);


%% Display values in table %%
mse = table(mseLowVar, mseMedVar, mseHighVar)
psnr = table(psnrLowVar, psnrMedVar, psnrHighVar)
snr = table(snrLowVar, snrMedVar, snrHighVar)
