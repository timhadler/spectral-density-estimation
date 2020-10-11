% Compares multiple results from different data sets

clc, clear, close all


num = 3;

dataA = zeros(4097, num);
dataB = zeros(4097, num);


for i = 1:num
    filename = sprintf('Data sets/A/Z00%d.txt', i);
    dataA(:,i) = load(filename);
    
    filename = sprintf('Data sets/C/N00%d.txt', i);
    dataB(:,i) = load(filename);
end

% remove last sample so we have an even number
dataA(4097, :) = [];
dataB(4097, :) = [];

n = length(dataA);
fs = 173.61;



for i = 1:num
    % Calculate and plot the periodogram
    [pxx, fxx] = pwelch(dataA(:,i), 64, 0, 256, fs);

    figure(i)
    plot(fxx, 10*log10(pxx))
    plot_title = sprintf('Welch''method - Data set A');
    title(plot_title)
    xlabel('f (Hz)')
    ylabel('Power (dB)')
    
    
    [pxx, fxx] = pwelch(dataB(:,i), 64, 0, 256, fs);
    
    figure(i+num)
    plot(fxx, 10*log10(pxx))
    plot_title = sprintf('Welch''method - Data set C');
    title(plot_title)
    xlabel('f (Hz)')
    ylabel('Power (dB)')
end





