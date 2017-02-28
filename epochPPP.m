function [EEG, splitParaTriggers] = epochPPP(EEG, paraMinEpoch, paraMaxEpoch, paraTriggers)

splitParaTriggers = strsplit(paraTriggers,' ')

EEG = pop_epoch( EEG, (splitParaTriggers), [(paraMinEpoch/1000), (paraMaxEpoch/1000)], 'newname', paraTriggers, 'epochinfo', 'yes');

end