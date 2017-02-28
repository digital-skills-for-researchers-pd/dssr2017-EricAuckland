function [paraElectrodes, paraTriggers, delaySize, paraMinEpoch, paraMaxEpoch] = parametersPPP()

% Parameters file
% What method do you desire
%whichMethod = {'Easy', 'Hard'};
%[Selection, OK] = listdlg('ListString', whichMethod);

% Parameters
prompt={'What electrode/s do you desire:','Name triggers to epoch around:','What is the trigger latency and amplifier lag (ms)?:','Epoch start (ms):','Epoch end (ms):'};
% Create all your text fields with the questions specified by the variable prompt.
title='ParametersPPP'; 
% The main title of your input dialog interface.
answer=inputdlg(prompt,title);
paraElectrodes = str2num(answer{1}); 
paraTriggers = (answer{2});
delaySize = str2num(answer{3});
paraMinEpoch = str2num(answer{4});
paraMaxEpoch = str2num(answer{5});
end