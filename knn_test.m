clc, clear, close all

Ntraining = 60; %Number of sets of data used per classification for training
estimateType = "Welch";

% Create model
Mdl = getkNNModel(estimateType, Ntraining)

% Evaluate model using resubstitution loss
rloss = resubLoss(Mdl)

% Calculate percentage of correct predictions from rest of dataset
getPredictionPercentage(Mdl, estimateType, Ntraining, "A", 1)
getPredictionPercentage(Mdl, estimateType, Ntraining, "B", 2)
getPredictionPercentage(Mdl, estimateType, Ntraining, "C", 3)
getPredictionPercentage(Mdl, estimateType, Ntraining, "D", 3)
getPredictionPercentage(Mdl, estimateType, Ntraining, "E", 4)