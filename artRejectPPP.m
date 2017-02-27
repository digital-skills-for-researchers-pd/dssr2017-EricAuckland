function [ EEG ] = artRejectPPP( EEG, paraMinEpoch, paraMaxEpoch )

[EEG, baddies] = pop_eegthresh(EEG,1,[1:128] ,-100,100,(paraMinEpoch/1000),((paraMaxEpoch-1)/1000),2,0);
EEG = pop_rejepoch( EEG, baddies, 0);

end