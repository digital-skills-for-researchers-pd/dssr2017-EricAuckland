function [EEG] = baselineCorrPPP(EEG, paraMinEpoch)

EEG = pop_rmbase(EEG, [paraMinEpoch    0]);

end

