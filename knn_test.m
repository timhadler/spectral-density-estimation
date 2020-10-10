clc, clear, close all

Ntraining = 50; %Number of sets of data used per classification for training

Mdl = getkNNModel("Welch", Ntraining)

%--------------------------------------------------------------------------
% Evaluate model
rloss = resubLoss(Mdl)

data = load('Data sets/E/S099.txt');
data = data(1:end-1);     % Remove last sample so we have an even number

n = length(data);
fs = 173.61;

% Calculate psd for each dataset
[pxx, fxx] = pwelch(data, 64, 25, 256, fs);%, n, fs);

spect = transpose(10*log10(pxx));
predictedClass = predict(Mdl, spect)