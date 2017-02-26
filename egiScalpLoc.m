% Make sure egi file is in data folder
% Apply EGI scalp locations
function [EEG] = egiScalpLoc(EEG, pathName) 
EEG=pop_chanedit(EEG, 'load',{strcat(pathName, 'GSN-HydroCel-129.sfp'), 'filetype' 'autodetect'},'setref',{'4:132' 'Cz'},'changefield',{132 'datachan' 0});
end