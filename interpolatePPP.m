function [EEG] = interpolatePPP(EEG)

foundBadChans = (EEG.chanlocs);
[EEG] = pop_rejchan(EEG, 'elec',[1:128] ,'threshold',5,'norm','on','measure','kurt');
[EEG] = pop_interp(EEG,foundBadChans,'Spherical');
    
end