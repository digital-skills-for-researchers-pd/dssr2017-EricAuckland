function [ALLEEG, EEG, CURRENTSET] = importDatasets(pathName, fileNames, ALLEEG, EEG, CURRENTSET)

% Imports firs
EEG = pop_readegi((strcat(pathName, fileNames)), [],[],'auto');
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'gui','off'); 
end