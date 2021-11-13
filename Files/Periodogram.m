clc, clear, close all

data = load('Data sets/A/Z001.txt');
data = data(1:end-1);     % Remove last sample so we have an even number

n = length(data);
fs = 173.61;

% Plot the raw data
figure(1)
plot([1:n], data)
title("Raw EEG data from dataset A")
xlabel('Sample')
ylabel('Volts')

% Calculate and plot the periodogram
[pxx, fxx] = periodogram(data, [], [], fs);

figure(2)
plot(fxx, 10*log10(pxx))
title('Periodogram power Spectral Density Estimate')
xlabel('f (Hz)')
ylabel('Power (dB)')

% Compare with the fast fourier transform
ft = fft(data);
f = fs*(0:(n/2))/n;

% Find two sided and one sided spectrum
P2 = abs(ft/n);
P1 = P2(1:n/2 + 1);
P1(2:end - 1) = 2*P1(2:end - 1);

figure(3)
plot(f, P1);
title('Single-sided Amplitude Spectrum')
xlabel('f (Hz)')
ylabel('|P1(f)|')
