function [ out ] = stretch(img)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to stretch histogram of an image
%
% Silvia Gioia Florio, matr. 119328
% @todo - Esercizio 2.4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Initialization %%
img = double(img);
% initialize parameters
kmax = max(max(img));
fmin = min(min(img));

%
%% apply transform %%
out = (kmax / (kmax - fmin)) * (img - fmin);
out = uint8(out);

end
