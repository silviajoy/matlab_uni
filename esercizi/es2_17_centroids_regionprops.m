%%
%%%% synthetic image with two rectangles %%%%
%%%
%% Initialize Image %%
% initialize black image
img = zeros(50,50);
% set two rectangles to white
img(19:40,30:40) = 1.;
img(10:40,10:16) = 1.;
% threshold image
imgBW = im2bw(img, 0.7);
% display result
imshow(img, 'InitialMagnification', 'fit');
title('Two Rectangles');

%% Centroids, Perimeters and Areas %%
% calculate centroids, perimeters and areas
props  = regionprops('table', imgBW, 'Centroid', 'Perimeter','Area')


%% Visualize Centroids
%   visualize centroid locations superimpoes to the
%   binary image
figure
imshow(imgBW, 'InitialMagnification', 'fit')
hold on
plot(props.Centroid(:,1), props.Centroid(:,2), 'r*')
hold off
title('Centroids');
