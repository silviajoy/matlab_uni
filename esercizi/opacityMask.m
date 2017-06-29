function [ out ] = opacityMask(img, mask, alpha)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to apply opacity mask on an image
%
% Silvia Gioia Florio, matr. 119328
% Esercizio 2.3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Initialization %%
img = double(img);
mask = double(mask);
%
% apply operator
diff = mask - img;
opacity = diff * alpha;
% uint8 translation to show the image
out = uint8(img + opacity);
 
end
