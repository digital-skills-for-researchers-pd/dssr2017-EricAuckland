% Clearing workspace
clear all;
clc;

% Parameters are collected here
[paraElectrodes, paraTriggers, delaySize, paraMinEpoch, paraMaxEpoch] = parametersPPP();

% Start EEGLAB
[ALLEEG, EEG] = eeglab;

% Find dataset
[fileNames, pathName] = findDataset();

% Import dataset
[ALLEEG, EEG, CURRENTSET] = importDatasets(pathName, fileNames, ALLEEG, EEG, CURRENTSET);

% Filter
[EEG] = filterPPP(EEG);

% EGI locations
[EEG] = egiScalpLoc(EEG, pathName);

% Correct trigger latency
[EEG] = correctLatency(EEG, delaySize);