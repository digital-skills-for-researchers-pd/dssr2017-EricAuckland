function [rawStats] = outputPPP( EEG )
%OUTPUTPPP Summary of this function goes here
%   Detailed explanation goes here

meanEEG = mean(EEG.data,3);

filename = 'testdata.xlsx';
xlswrite(filename,meanEEG,'')

end

