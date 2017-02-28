function [paraElectrodes, paraTriggers, delaySize, paraMinEpoch, paraMaxEpoch] = parametersPPP()

% Parameter questions
prompt={'What electrode/s do you desire:','Name triggers to epoch around:','What is the trigger latency and amplifier lag (ms)?:','Epoch start (ms):','Epoch end (ms):'};
title='ParametersPPP'; 

% The answers are converted to variables and usual types
answer=inputdlg(prompt,title);
paraElectrodes = str2num(answer{1}); 
paraTriggers = (answer{2});
delaySize = str2num(answer{3});
paraMinEpoch = str2num(answer{4});
paraMaxEpoch = str2num(answer{5});
end