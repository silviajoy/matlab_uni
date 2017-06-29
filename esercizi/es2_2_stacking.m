%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% script for analizing stacking effect of noisy
% images
%
% Silvia Gioia Florio, matr. 119328
% @todo - Excercise 2.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% initialize synthetic image
% initialize black image
img = zeros(30,30);
% create a white rectangle
img(5:24, 13:17)=1.;

%% adding noise %%
% initialize array of noisy images
noisy = zeros(30,30,5);
% iterate to produce five images
for i=1:5
    % 0.1 variance noise
    noisy(:,:,i) = imnoise (img, 'gaussian', 0, 0.1);
end

%% dispay noisy images with histogram %%
figure;
% loop to display noisy images
for i=1:5
    subplot(2,5,i);
    imshow(noisy(:,:,i), 'InitialMagnification', 'fit');
    subplot(2,5,5+i);
    imhist(noisy(:,:,i));
end

%% apply stacking %%
% call function
res = stacking(noisy);

%% display stacking result %%
% original image
figure;
subplot(2,3,1)
imshow(img,'InitialMagnification', 'fit');
title('Original Image')
subplot(2,3,4)
imhist(img)
% noisy image example
subplot(2,3,2)
imshow(noisy(:,:,1),'InitialMagnification', 'fit');
title('Noisy Image Example')
subplot(2,3,5)
imhist(noisy(:,:,1))
% stacked image
subplot(2,3,3)
imshow(res,'InitialMagnification', 'fit');
title('Image after Stacking')
subplot(2,3,6)
imhist(res)

%% compare images using MSE %%
noisyMse = [];
% loop to claculate mse of noisy images
for i=1:5
    noisyMse(i) = mse(img,noisy(:,:,i));
end
% calculate stacked image mse
stackingMse = mse(img,res);

%% display results using tables %%
noisyMSE = array2table(noisyMse)
stackingMSE = table(stackingMse)





