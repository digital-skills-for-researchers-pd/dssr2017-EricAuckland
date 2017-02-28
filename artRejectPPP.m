function [ EEG ] = artRejectPPP( EEG, paraMinEpoch, paraMaxEpoch )

% Finds artifacts over certain values
[EEG, baddies] = pop_eegthresh(EEG,1,[1:128] ,-100,100,(paraMinEpoch/1000),((paraMaxEpoch-1)/1000),2,0);

% Rejects the abnormal values from dataset
EEG = pop_rejepoch( EEG, baddies, 0);

end