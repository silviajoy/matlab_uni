%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 1.2.a
% Aggiungere rumore gaussiano a media nulla, con tre livelli diversi di varianza:
% 0.01, 0.1, 1. Visualizzare l’ immagine sorgente e le tre immagini rumorose.
% Per la simulazione del rumore usare la funzione MATLAB imnoise()
%
% Silvia Gioia Florio, matr. 119328
% version 1.0, 07/03/2017
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%% creo immagine sintetica
img = zeros(30,30);
img(5:24, 13:17)=1.;


%% creazione rumore %%

% rumore con varianza 0.01
noise1 = imnoise (img, "gaussian", 0, 0.01);

% rumore con varianza 0.1 
noise2 = imnoise (img, "gaussian", 0, 0.1);

% rumore con varianza 1
noise3 = imnoise (img, "gaussian", 0, 1.);


%% visualizzazione immagine + rumore %%
figure
% immagine senza rumore
subplot(1,4,1), imshow(img)
title("zeros", 'FontSize', 20)
% varianza 0.01
subplot(1,4,2), imshow(noise1)
title("Varianza 0.01", 'FontSize', 20)
% varianza 0.1
subplot(1,4,3), imshow(noise2)
title("Varianza 0.1", 'FontSize', 20)
% varianza 1
subplot(1,4,4), imshow(noise3)
title("Varianza 1", 'FontSize', 20)


