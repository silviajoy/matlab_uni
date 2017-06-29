function [ intensProfile ] = intProfile(seq, nsample)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function for intensity profiling an image.
%
% Silvia Gioia Florio, matr. 119328
% 11/04/2017 - Esercizio 2.11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%% Initialization %%

intensProfile = [];
nseq = length(seq);
for i = 1:nseq
    intensProfile = [intensProfile seq(i)*ones(1,nsample)];
end
