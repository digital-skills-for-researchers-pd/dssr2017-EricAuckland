function [EEG] = epochPPP(EEG, paraMinEpoch, paraMaxEpoch, paraTriggers)

EEG = pop_epoch( EEG, {paraTriggers}, [(paraMinEpoch/1000), (paraMaxEpoch/1000)], 'newname', paraTriggers, 'epochinfo', 'yes');

end