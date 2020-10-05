clc, clear, close all

spect_data = [];
classification = [];

for i = 1:250
    if i < 10
        filename = sprintf('Data sets/A/Z00%d.txt', i);
        classification(1, i) = 1;
    elseif i < 51
        filename = sprintf('Data sets/A/Z0%d.txt', i);
        classification(1, i) = 1;
    elseif i < 60
        filename = sprintf('Data sets/B/O00%d.txt', i-50);
        classification(1, i) = 2;
    elseif i < 101
        filename = sprintf('Data sets/B/O0%d.txt', i-50);
        classification(1, i) = 2;
    elseif i < 110
        filename = sprintf('Data sets/C/N00%d.txt', i-100);
        classification(1, i) = 3;
    elseif i < 151
        filename = sprintf('Data sets/C/N0%d.txt', i-100);
        classification(1, i) = 3;
    elseif i < 160
        filename = sprintf('Data sets/D/F00%d.txt', i-150);
        classification(1, i) = 4;
    elseif i < 201
        filename = sprintf('Data sets/D/F0%d.txt', i-150);
        classification(1, i) = 4;
    elseif i < 210
        filename = sprintf('Data sets/E/S00%d.txt', i-200);
        classification(1, i) = 5;
    else
        filename = sprintf('Data sets/E/S0%d.txt', i-200);
        classification(1, i) = 5;
    end
    
    data = load(filename);
    data = data(1:end-1);     % Remove last sample so we have an even number

    n = length(data);
    fs = 173.61;

    % Calculate and plot the periodogram
    [pxx, fxx] = pwelch(data, 64, 25, 256, fs);%, n, fs);

    for j = 1:129
        spect_data(i, j) = transpose(10*log10(pxx(j)));
    end
end

Mdl = fitcknn(spect_data, classification, 'NumNeighbors', 4);

rloss = resubLoss(Mdl)