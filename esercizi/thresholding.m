function [ out ] = thresholding(input, r, s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function to slice an image by thresholding.
% Input values are divided in bands by vector r
% and then normalized by vector s.
%
% Silvia Gioia Florio, matr. 119328
% Esercizio 2.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Initialization %%
out = input;
% initialize parameters
sizeIn = size(input);
sizeR = size(r);
sizeS = size(s);
sizeR = sizeR(2);
sizeS = sizeS(2);
% errors
if(sizeR~=sizeS-1)
    disp('Incompatible sizes');
    return
end
%
%% apply operator %%
for i=1:sizeIn(1) 
    for j=1:sizeIn(2)
        k=1;
        while(k<=sizeR && r(k)<input(i,j)) 
            k=k+1;
        end
        out(i,j) = s(k);
    end
end

end
