%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 1.1.c
% Visualizzare ciascuna componente di colore R, G, B dell’immagine ‘peppers’ e il
% e il relativo istogramma dei livelli di intensità.
%
% Silvia Gioia Florio, matr. 119328
% version 1.0, 01/03/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure

%% componente rossa %%
% lettura immagine
img = imread("peppers.png");

% azzeramento delle componenti blu e verde
img(:,:,2)=0.;
img(:,:,3)=0.;

img_red = img;

% plot dell'immagine rossa
subplot(3,2,1), imshow(img_red)
% plot dell'istogramma dei livelli di rosso
subplot(3,2,2), imhist(img(:,:,1)), grid


%% componente verde %%
% lettura immagine
img = imread("peppers.png");

% azzeramento delle componenti rossa e blu
img(:,:,1)=0.;
img(:,:,3)=0.;

img_green = img;

% plot dell'immagine verde
subplot(3,2,3), imshow(img_green)
% plot dell'istogramma dei livelli di verde
subplot(3,2,4), imhist(img(:,:,2)), grid


%% componente blu %%
% lettura immagine
img = imread("peppers.png");

% azzeramento delle componenti rossa e verde
img(:,:,1)=0.;
img(:,:,2)=0.;

img_green = img;

% plot dell'immagine blu
subplot(3,2,5), imshow(img_green)
% plot dell'istogramma dei livelli di blu
subplot(3,2,6), imhist(img(:,:,3)), grid