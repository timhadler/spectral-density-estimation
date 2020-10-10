function [Mdl] = getkNNModel(psdMethod, Ntraining)
%Trains a model for kNN classification of EEG signals
%   Detailed explanation goes here

fs = 173.61;

Ndatasets = 5;

spect_data = [];
classification = [];
classifierHealthyOpen = 1;
classifierHealthyClosed = 2;
classifierEpilepsyNoSeizure = 3;
classifierEpilepsySeizure = 4;

%Extract data from files and set classifier based on filename
for i = 1:Ntraining*Ndatasets
    if i < 10
        filename = sprintf('Data sets/A/Z00%d.txt', i);
        classification(1, i) = classifierHealthyOpen;
    elseif i < Ntraining + 1
        filename = sprintf('Data sets/A/Z0%d.txt', i);
        classification(1, i) = classifierHealthyOpen;
    elseif i < Ntraining + 10
        filename = sprintf('Data sets/B/O00%d.txt', i-Ntraining);
        classification(1, i) = classifierHealthyClosed;
    elseif i < 2*Ntraining + 1
        filename = sprintf('Data sets/B/O0%d.txt', i-Ntraining);
        classification(1, i) = classifierHealthyClosed;
    elseif i < 2*Ntraining + 10
        filename = sprintf('Data sets/C/N00%d.txt', i-2*Ntraining);
        classification(1, i) = classifierEpilepsyNoSeizure;
    elseif i < 3*Ntraining + 1
        filename = sprintf('Data sets/C/N0%d.txt', i-2*Ntraining);
        classification(1, i) = classifierEpilepsyNoSeizure;
    elseif i < 3*Ntraining + 10
        filename = sprintf('Data sets/D/F00%d.txt', i-3*Ntraining);
        classification(1, i) = classifierEpilepsyNoSeizure;
    elseif i < 4*Ntraining + 1
        filename = sprintf('Data sets/D/F0%d.txt', i-3*Ntraining);
        classification(1, i) = classifierEpilepsyNoSeizure;
    elseif i < 4*Ntraining + 10
        filename = sprintf('Data sets/E/S00%d.txt', i-4*Ntraining);
        classification(1, i) = classifierEpilepsySeizure;
    else
        filename = sprintf('Data sets/E/S0%d.txt', i-4*Ntraining);
        classification(1, i) = classifierEpilepsySeizure;
    end
    
    % Load data from file
    data = load(filename);
    data = data(1:end-1);     % Remove last sample so we have an even number
    
    % Estimate PSD using selected data
    if psdMethod == "Welch"
        % Calculate psd for each dataset
        [pxx, fxx] = pwelch(data, 64, 25, 256, fs);%, n, fs);
    end

    for j = 1:129
        spect_data(i, j) = transpose(10*log10(pxx(j)));
    end
end

% Create model
Mdl = fitcknn(spect_data, classification, 'NumNeighbors', 4);

end

