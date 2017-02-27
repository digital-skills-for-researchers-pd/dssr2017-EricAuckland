function [EEG, indelec] = interpolatePPP(EEG)

[EEG, indelec] = pop_rejchan(EEG, 'elec',[1:128] ,'threshold',5,'norm','on','measure','kurt');
[EEG] = pop_interp(EEG,indelec,'Spherical');
    
end

