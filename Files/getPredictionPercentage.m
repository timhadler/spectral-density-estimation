function [percentageCorrect] = getPredictionPercentage(Mdl,psdMethod,Ntraining,dataset,correctClassifier)
%Calculates how many datasets the model correctly classifies
Ndatasets = 100;
Nprediction = Ndatasets - Ntraining;

classifierHealthyOpen = 1;
classifierHealthyClosed = 2;
classifierEpilepsyNoSeizure = 3;
classifierEpilepsySeizure = 4;

nCorrect = 0;

for i = Ntraining+1:Ndatasets
    if dataset == "A"
        if i < 100
            filename = sprintf('Data sets/A/Z0%d.txt', i);
        else i == 100;
            filename = sprintf('Data sets/A/Z%d.txt', i);
        end
    elseif dataset == "B"
        if i < 100
            filename = sprintf('Data sets/B/O0%d.txt', i);
        else i == 100;
            filename = sprintf('Data sets/B/O%d.txt', i);
        end
    elseif dataset == "C"
        if i < 100
            filename = sprintf('Data sets/C/N0%d.txt', i);
        else i == 100;
            filename = sprintf('Data sets/C/N%d.txt', i);
        end
    elseif dataset == "D"
        if i < 100
            filename = sprintf('Data sets/D/F0%d.txt', i);
        else i == 100;
            filename = sprintf('Data sets/D/F%d.txt', i);
        end
    else
        if i < 100
            filename = sprintf('Data sets/E/S0%d.txt', i);
        else i == 100;
            filename = sprintf('Data sets/E/S%d.txt', i);
        end
    end
    
    % Calculate percentage of correct predictions from rest of dataset
    data = load(filename);
    data = data(1:end-1);     % Remove last sample so we have an even number
    
    n = length(data);
    fs = 173.61;
    
    if psdMethod == "Periodogram"
        [pxx, fxx] = periodogram(data, [], [], fs);
        spect = transpose(10*log10(pxx));
    elseif psdMethod == "Bartlett"
        %Bartlett's method
        pxx = BartlettsMethod(data);
        spect =  pxx;
    elseif psdMethod == "Welch"
        % Calculate psd for each dataset
        [pxx, fxx] = pwelch(data, 64, 25, 4094, fs);%, n, fs);
        spect = transpose(10*log10(pxx));
    end
    
    predictedClassifier = predict(Mdl, spect);
    
    if predictedClassifier == correctClassifier
        nCorrect = nCorrect + 1;
    else
        predictedClassifier;
    end
end

percentageCorrect = nCorrect/Nprediction * 100;
end

