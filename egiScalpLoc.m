% Make sure egi file is in data folder
% Apply EGI scalp locations
EEG=pop_chanedit(EEG, 'load',{strcat(pathname, 'GSN-HydroCel-129.sfp'), 'filetype' 'autodetect'},'setref',{'4:132' 'Cz'},'changefield',{132 'datachan' 0});