function [EEG, splitParaTriggers] = epochPPP(EEG, paraMinEpoch, paraMaxEpoch, paraTriggers)

% Converts trigger values to a string and splits unique triggers
splitParaTriggers = strsplit(paraTriggers,' ')

% Epochs the data around triggers and epoch values
EEG = pop_epoch( EEG, (splitParaTriggers), [(paraMinEpoch/1000), (paraMaxEpoch/1000)], 'newname', paraTriggers, 'epochinfo', 'yes');

end