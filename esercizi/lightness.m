function [ out ] = lightness(img, L)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to add lightness punctual operator on an image.
%
% Silvia Gioia Florio, matr. 119328
% @todo - Esercizio 2.1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Initialization %%
% initialize output image
out = uint8(zeros(length(img),length(img(1))));
%
%% apply the operator %%
sizes = size(img);
for i=1:sizes(1)
    for j=1:sizes(2) 
        out(i,j) = img(i,j)+L;
    end 
end
