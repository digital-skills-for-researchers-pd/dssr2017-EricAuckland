function [EEG] = correctLatencyPPP(EEG, delaySize)

% Corrects for the amplifier and stimulus presentation delay
samplingRateFix = 1000/EEG.srate;
adjustedDelaySize = delaySize/samplingRateFix;

for j = 1:size(EEG.event,2);
    EEG.event(j).latency = EEG.event(j).latency + adjustedDelaySize;
end;