function [EEG] = filterPPP(EEG)
% Filter the dataset
EEG  = pop_basicfilter( EEG,  1:128 , 'Boundary', 'boundary', 'Cutoff',  [ 0.1 30], 'Design', 'butter', 'Filter', 'bandpass', 'Order',  4 );
end