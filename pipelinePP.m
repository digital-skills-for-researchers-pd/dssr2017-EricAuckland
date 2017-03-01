%% Make sure you have EEGLAB and ERPLAB toolboxes installed.
%% Create a data folder with your data in it. This flder needs to contain the EGI scalp locations.

%% Clearing workspace
clear all; clc;

%% Parameters are collected here
[paraElectrodes, paraTriggers, delaySize, paraMinEpoch, paraMaxEpoch] = parametersPPP();

%% Start EEGLAB
[ALLEEG, EEG] = eeglab;

%% Find dataset
% Opens dialog to find a file
[fileNames, pathName] = uigetfile({'*.raw','RAW-files (*.raw)'}, 'Select the RAW data files','MultiSelect', 'on');

%% Import dataset
[ALLEEG, EEG, CURRENTSET] = importDatasetsPPP(pathName, fileNames, ALLEEG, EEG, CURRENTSET);

%% Filter
% Filters the dataset
EEG  = pop_basicfilter( EEG,  1:128 , 'Boundary', 'boundary', 'Cutoff',  [ 0.1 30], 'Design', 'butter', 'Filter', 'bandpass', 'Order',  4 );

%% EGI locations
EEG=pop_chanedit(EEG, 'load',{strcat(pathName, 'GSN-HydroCel-129.sfp'), 'filetype' 'autodetect'},'setref',{'4:132' 'Cz'},'changefield',{132 'datachan' 0});

%% Correct trigger latency
[EEG] = correctLatencyPPP(EEG, delaySize);

%% Interpolation
[EEG] = interpolatePPP(EEG);

%% Average reference
EEG = pop_reref( EEG, [],'refloc',struct('labels',{'Cz'},'Y',{0},'X',{5.4492e-16},'Z',{8.8992},'sph_theta',{0},'sph_phi',{90},'sph_radius',{8.8992},'theta',{0},'radius',{0},'type',{''},'ref',{'Cz'},'urchan',{132},'datachan',{0}));

%% Epoch
[EEG, splitParaTriggers] = epochPPP(EEG, paraMinEpoch, paraMaxEpoch, paraTriggers);

%% Baseline correction
EEG = pop_rmbase(EEG, [paraMinEpoch    0]);

%% Artefact rejection
[EEG] = artRejectPPP(EEG, paraMinEpoch, paraMaxEpoch);

%% Plot ERP
[EEG] = plotFigurePPP(EEG, paraElectrodes, paraTriggers);