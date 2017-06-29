%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 1.1.c
% Visualizzare separatamente, in forma di immagini, le tre componenti di colore R,
% G, B.
%
% Silvia Gioia Florio, matr. 119328
% version 1.0, 01/03/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% componente rossa %%
% lettura immagine
img = imread("peppers.png");

% azzeramento delle componenti blu e verde
img(:,:,2)=0.;
img(:,:,3)=0.;

img_red = img;

% plot dell'immagine rossa
figure, imshow(img_red)
title("Red", "FontSize", 20)


%% componente verde %%
% lettura immagine
img = imread("peppers.png");

% azzeramento delle componenti rossa e blu
img(:,:,1)=0.;
img(:,:,3)=0.;

img_green = img;

% plot dell'immagine verde
figure, imshow(img_green)
title("Green", "FontSize", 20)



%% componente blu %%
% lettura immagine
img = imread("peppers.png");

% azzeramento delle componenti rossa e verde
img(:,:,1)=0.;
img(:,:,2)=0.;

img_green = img;

% plot dell'immagine blu
figure, imshow(img_green)
title("Blue", "FontSize", 20)