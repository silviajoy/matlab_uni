function [ out ] = negative(img)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to return the negative of an image
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
        a = double((img(i,j)))*(-1) + 254;
        out(i,j) = uint8(a);
    end 
end
