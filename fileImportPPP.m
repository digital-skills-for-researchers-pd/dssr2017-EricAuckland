% Clearing workspace
clear all
clc

% Parameters are collected here
run('parameters')

% Start EEGLAB
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

% Open dialog to import files
[filenames, pathname] = uigetfile({'*.raw','RAW-files (*.raw)'}, 'Select the RAW data files','MultiSelect', 'on');

% Add first file
EEG = pop_readegi(strcat(pathname,filenames), [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 