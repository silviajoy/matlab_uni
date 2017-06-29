

function [ outputVals ] = partition( inputVals, erre, esse )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Partiziona in tre bande i valori di intensità ricevuti in input.
%   Input:
%       - inputVals: valori di intensità da partizionare;
%       matrice di valori nell'intervallo [0,1]; può essere una matrice riga;
%       - erre: array di due valori nell'intervallo [0,1] usati per raggruppare 
%       le intensità in 3 bande (l'array deve essere ordinato in modo crescente);
%       - esse: array di tre valori nell'intervallo [0,1]; sono i tre
%       valori di intensità associati a ciascuna banda.
%   Output:
%       - outputVals: matrice di valori ricalcolati associando a
%       ciascuno degli elementi della matrice di input un nuovo valore
%       in base alla sua banda di appartenenza.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% copio input in output
outputVals = inputVals;
% verifico valori ricevuti in input
erreSize = size(erre);
esseSize = size(esse);
if (erreSize(1,2) < 2) || (esseSize(1,2) < 3)
    % non sono stati specificati tutti i valori attesi (2 punti di
    % discontinuità e 3 valori di intensità, 1 per ciascuna delle 3 bande)
    % restituisco immagine input
    disp('parametri non sufficienti');
    return
end
if (max(max(erre)) > 1) || (max(max(esse)) > 1) || (max(max(inputVals)) > 1)
    disp('valori non normalizzati');
    % restituisco immagine input
    return;
end
if (min(min(erre)) < 0) || (min(min(esse)) < 0) || (min(min(inputVals)) < 0)
    disp('valori non normalizzati');
    % restituisco immagine input
    return;
end
%
% per ogni elemento della matrice determino la banda di appartenenza e
% quindi il nuovo valore di intensità
inputSize = size(inputVals);
numRows = inputSize(1,1);
numCols = inputSize(1,2);
for row = 1:numRows
    for col = 1:numCols
        if inputVals(row,col) < erre(1,1)
            % inputVal in [0,R1[ => outputVal = S1
            outputVals(row,col) = esse(1,1);
        elseif inputVals(row,col) <= erre(1,2)
            % inputVal in [R1,R2] => outputVal = S2
            outputVals(row,col) = esse(1,2);
        else
            % inputVal in ]R2,1] => outputVal = S3
            outputVals(row,col) = esse(1,3);
        end
    end
end


end