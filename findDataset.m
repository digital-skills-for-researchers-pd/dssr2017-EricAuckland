function [fileNames, pathName] = findDataset()
% Open dialog to import files
[fileNames, pathName] = uigetfile({'*.raw','RAW-files (*.raw)'}, 'Select the RAW data files','MultiSelect', 'on');
end