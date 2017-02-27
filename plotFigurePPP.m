function [ EEG ] = plotFigurePPP(EEG, paraElectrodes, paraTriggers);

figure; pop_erpimage(EEG,1, [paraElectrodes],[[]],'title',10,1,{paraTriggers},[],'','yerplabel','\muV','erp','on','cbar','on','topo', { [paraElectrodes] EEG.chanlocs EEG.chaninfo } );

end

