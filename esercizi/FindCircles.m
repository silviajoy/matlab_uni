%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Image Segmentation: script to extract regions
% and region geometric features
%
% VR - may 7, 2017 - Adapted from MATLAB examples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% a)construct the image
%
% load the image
img=imread('eight.tif');
% threshold the image
imgBW = im2bw(img, 0.7);
% negative the image:
% i.e., white objects ona a dark background
imgBW=1.-imgBW;
%
% visualization of the image
figure
subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imhist(img), grid;
subplot(2,2,3);
imshow(imgBW);
%
% editing the image: insert rectangles
imgBW(10:80, 10:50)=1.;
imgBW(190:220, 20:140)=1.;
imgBW(110:220, 280:300)=1.;
subplot(2,2,4);
imshow(imgBW);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% b) Extraction of Edges and Boundaries
imEdge = edge(imgBW);
[Bound Label] = bwboundaries(imgBW,'noholes');
%
% visualization of edges and boundaries
figure;
subplot(1,2,1);
imshow(imEdge);
subplot(1,2,2);
imshow(Label);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% c) Anaysis of Region Boundaries (NOT Edges!)
hold on
for k = 1:length(Bound)
    boundary = Bound{k};
    plot(boundary(:,2), boundary(:,1), 'b', 'LineWidth', 2)
end
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% d) Analysis of region features using regionprops()
%     Features are Centroids
% 
strucCent = regionprops('table', Label, 'centroid');
%
%   centroids are assembled into a matrix
centroids = cat(1,strucCent.Centroid);
%
%   visualize centroid locations superimpoes to the
%   binary image
figure
imshow(Label)
hold on
plot(centroids(:,1), centroids(:,2), 'r*')
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% d) Analysis of region features using regionprops()
%     Features are: Perimeters and Areas
% 
strucPerim = regionprops('table', Label, 'Perimeter');
strucArea = regionprops('table', Label, 'Area');
%
% perimeters and areas assembled into single matrices
perimeters = cat(1,strucPerim.Perimeter);
areas = cat(1,strucArea.Area);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% e) Classify the detected regions according to a 
%     roundness parameter recognize round objects
figure;
imshow(Label)
hold on
% loop over the boundaries
for k=1:length(Bound)
    perimeter = perimeters(k);
    area = areas(k);
    % compute the roundness metric
    if perimeter > 0
        metric = 4*pi*area/perimeter^2;
    else metric = 0.;
    end
    %
    threshold = 0.9;
    
    if metric > threshold
        plot(centroids(k,1),centroids(k,2),'r*');
    end
    
end