function [ out ] = stacking(noisyArray)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to calculate mean of every pixel in
% an array of noisy images (stacking)
%
% Silvia Gioia Florio, matr. 119328
% @todo - Esercizio 2.2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Initialization %%
% number of images
sizes = size(noisyArray);
% initialize output image
out = zeros(sizes(1),sizes(2));
%
%% calculate mean %%
numOfImages = sizes(3);
for i=1:sizes(1)
    for j=1:sizes(2)
        % summation
        sum = 0;
        for k=1:sizes(3)
            sum = sum+noisyArray(i,j,k);
        end
        % mean
        out(i,j) = (1/numOfImages)*sum;
    end 
end
