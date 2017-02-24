% Clearing workspace
clear all;
clc;

% Parameters are collected here
[paraElectrodes, paraTriggers, delaySize, paraMinEpoch, paraMaxEpoch] = parametersPPP();

% Start EEGLAB
[ALLEEG, EEG,] = eeglab;

% Find dataset
[fileNames, pathName] = findDataset();

% Import dataset
% [fileNames, pathName, ALLEEG, EEG] = importDatasets();

% Filter
run('filterPPP');

% EGI locations
run('egiScalpLoc.m');

% Correct trigger latency


