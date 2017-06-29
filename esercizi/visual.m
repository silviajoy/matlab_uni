%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 1.1.b
% Visualizzare l’immagine ‘cameraman’; i metadati; la sua look-up table (LUT);
% l’istogramma dei livelli di grigio.
%
% Silvia Gioia Florio, matr. 119328
% version 1.0, 01/03/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% variabile contente il nome dell'immagine
path = 'peppers.png';

%% lettura dell'immagine
img = imread(path); 

%% visualizzazione dell'immagine
imshow(img)
title('Image', 'FontSize', 20);

%% stampa dei metadati
metadata = imfinfo(path)