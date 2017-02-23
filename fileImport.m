% Clearing workspace
clear all
clc

% Parameters are collected here
run('parameters')

% Start EEGLAB
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

% Open dialog to import files
[filenames, pathname] = uigetfile({'*.raw','RAW-files (*.raw)'}, 'Select the RAW data files','MultiSelect', 'on');
if ~iscellstr(filenames), filenames = {filenames}; end

% Check if multiple files and append...
EEG = pop_readegi('pathname''filenames', [],[],'auto');
