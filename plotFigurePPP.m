function [ EEG ] = plotFigurePPP(EEG, paraElectrodes, paraTriggers);

% Plots basic ERP
figure; pop_erpimage(EEG,1, paraElectrodes,[[]],(strcat((num2str(paraElectrodes)),'/', paraTriggers)),10,1,{},[],'' ,'yerplabel','\muV','erp','on');

end
