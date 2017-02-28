function [ EEG ] = plotFigurePPP(EEG, paraElectrodes);

% Plots basi ERP
figure; pop_erpimage(EEG,1, paraElectrodes,[[]],(num2str(paraElectrodes)),10,1,{},[],'' ,'yerplabel','\muV','erp','on');

end
