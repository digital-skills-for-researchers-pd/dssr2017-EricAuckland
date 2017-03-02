function [ALLEEG, EEG, CURRENTSET, numberOfDatasets] = importDatasetsPPP(pathName, fileNames, ALLEEG, EEG, CURRENTSET)

if isstr(fileNames) 
    numberOfDatasets = 1
else numberOfDatasets = size(fileNames,2)
end
    
for i = 1:numberOfDatasets;
    % Imports files
    EEG = pop_readegi((strcat(pathName, fileNames{1,i})), [],[],'auto');
    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, i,'gui','off');
end;

EEG = pop_mergeset( ALLEEG, [1:numberOfDatasets], 0);
[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
[ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 1);
eeglab redraw;
ALLEEG = pop_delset( ALLEEG, [2:numberOfDatasets] );

