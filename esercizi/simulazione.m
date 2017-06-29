%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script simulazione esame
%
% Silvia Gioia Florio, matr. 119328
% 16/05/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Lettura immagine %%
img = imread('planefig.gif');

%% Binarizzazione immagine %%
imgBW = im2bw(img, 0);
imgBW = double(imgBW);

%% Visualizzazione dei risultati %%
figure('name', 'planefig.gif')
%immagine sorgente
subplot(1,3,1)
imshow(img, 'InitialMagnification', 'fit')
title('planefig')
%istogramma
subplot(1,3,2)
imhist(img);
title('istogramma')
%immagine sorgente
subplot(1,3,3)
imshow(imgBW, 'InitialMagnification', 'fit')
title('planefig binarizzata')

%% Aggiunta del rumore %%
noisyBW = imnoise(imgBW, 'gaussian', 0, .1);

%% Visualizzazione del risultato %%
figure('name', 'aggiunta del rumore')
%immagine binarizzata
subplot(2,2,1)
imshow(imgBW, 'InitialMagnification', 'fit')
title('planefig binarizzata')
%istogramma dell'immagine binarizzata
subplot(2,2,2)
imhist(imgBW);
title('istogramma')
%immagine rumorosa
subplot(2,2,3)
imshow(noisyBW, 'InitialMagnification', 'fit')
title('binarizzata e rumorosa')
%istogramma dell'immagine rumorosa
subplot(2,2,4)
imhist(noisyBW);
title('istogramma')

%% Filtraggio %%
%inizializzazione dei filtri
gauss01=fspecial('gaussian',3, 0.1);
gauss04=fspecial('gaussian',3, 0.4);
gauss08=fspecial('gaussian',3, 0.8);
%
%applico i filtri
filtered01= imfilter(noisyBW,gauss01);
filtered04= imfilter(noisyBW,gauss04);
filtered08= imfilter(noisyBW,gauss08);

%% Visualizzazione dei risultati %%
figure('name', 'filtraggio')
%immagine rumorosa
subplot(2,2,1)
imshow(noisyBW, 'InitialMagnification', 'fit')
title('planefig rumorosa')
%filtro 0.1
subplot(2,2,2)
imshow(filtered01, 'InitialMagnification', 'fit')
title('stdev = 0.1')
%filtro 0.4
subplot(2,2,3)
imshow(filtered04, 'InitialMagnification', 'fit')
title('stdev = 0.4')
%filtro 0.8
subplot(2,2,4)
imshow(filtered08, 'InitialMagnification', 'fit')
title('stdev = 0.8')

%% Valutazione dei filtri %%
% calcolo mse delle immagini
mses = zeros(1,4); 
%rumorosa
mses(1) = immse(noisyBW, imgBW);
%filtrate
mses(2) = immse(filtered01, imgBW);
mses(3) = immse(filtered04, imgBW);
mses(4) = immse(filtered08, imgBW);

%% Visualizzazione dei risultati %%
figure;
colnames = {'rumorosa', 'stdv 0.1', 'stdv 0.4','stdv 0.8'};
uitable('Data', mses, 'ColumnName', colnames, 'Position', [110 160 335 100]);
 

