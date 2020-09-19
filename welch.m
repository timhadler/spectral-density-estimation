clc, clear, close all

data = load('Data sets/A/Z001.txt');
data = data(1:end-1);     % Remove last sample so we have an even number

n = length(data);
fs = 173.61;

% Calculate and plot the periodogram
[pxx, fxx] = pwelch(data, 64, 0)%, n, fs);

plot(fxx, 10*log10(pxx))
title('Welch''s method power Spectral Density Estimate')
xlabel('f (Hz)')
ylabel('Power (dB)')

% Compare with the fast fourier transform
ft = fft(data);
f = fs*(0:(n/2))/n;

% Find two sided and one sided spectrum
P2 = abs(ft/n);
P1 = P2(1:n/2 + 1);
P1(2:end - 1) = 2*P1(2:end - 1);

figure(2)
plot(f, P1);
title('Single-sided Amplitude Spectrum')
xlabel('f (Hz)')
ylabel('|P1(f)|')
