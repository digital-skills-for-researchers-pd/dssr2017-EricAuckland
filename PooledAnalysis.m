
clear all
PF = @PAL_Weibull;
contrastMin = 0.001;
contrastMax = 1;
conNumSteps = 50;
conSpace = logspace(log10(contrastMin),log10(contrastMax),conNumSteps);
priorStepSize = 20;
alphaThresholdRange = logspace(log10(contrastMin),log10(contrastMax),priorStepSize);
slopeMin = .1;
slopeMax = .9;
slopeRange = linspace(slopeMin,slopeMax,priorStepSize);
guessRate = .5;
lapseRate = 0.02;

% Tetanus
% dont use pariticipant 1


% pptGroups(1).members = [1 4 5 7 8 9 12 13 16 17 21 24 25 28 29];
% pptGroups(2).name = 'Adapt to 135';
% pptGroups(2).members = [2 3 6 10 11 14 15 18 19 20 22 23 26 27 30];
% 0.04

%% and in respective paricipants, since part1 is no good, 2=1, 3=2 etc
pptGroups(1).name = 'Adapt to 45';
pptGroups(1).members = [1 4 5 7 8 12 13 16 17 21 24];
pptGroups(2).name = 'Adapt to 135';
pptGroups(2).members = [23 6 10 11 14 15 18 19 20 22 23 25];
pptGroups(1).n = length(pptGroups(1).members);
pptGroups(2).n = length(pptGroups(2).members);

%% select .mat data files: 1 for each participant
[filenames, pathname] = uigetfile({'*.mat','MAT-files (*.mat)'}, 'Select the MATLAB data files','MultiSelect', 'on');
if ~iscellstr(filenames), filenames = {filenames}; end

 
%% master loop: load each Ppt's AMPMs
for iFile = 1:size(filenames,2)
   
    clear theParticipant;
    clear allData Data_trial;
    load([pathname filenames{iFile}],'participantNumber','amStruct45','amStruct135');
    
	ppt(iFile) = participantNumber;
    am045(iFile) = amStruct45;
    am135(iFile) = amStruct135;
    
 %    TaskFigureNew;
end
    

%% repeat twice, one for each ppt group.
for whichGroup = 1:length(pptGroups)
    
    pptGroups(whichGroup).am045thresholds = arrayfun(@(x) x.threshold(end), am045(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am045slopes = arrayfun(@(x) x.slope(end), am045(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am045slopeSEs = arrayfun(@(x) x.seSlope(end), am045(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am045thresholdSEs = arrayfun(@(x) x.seThreshold(end), am045(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am135thresholds = arrayfun(@(x) x.threshold(end), am135(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am135slopes = arrayfun(@(x) x.slope(end), am135(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am135slopeSEs = arrayfun(@(x) x.seSlope(end), am135(pptGroups(whichGroup).members));
    pptGroups(whichGroup).am135thresholdSEs = arrayfun(@(x) x.seThreshold(end), am135(pptGroups(whichGroup).members));

    pptGroups(whichGroup).meanThreshold045 = mean(pptGroups(whichGroup).am045thresholds);
    pptGroups(whichGroup).seThreshold045 = std(pptGroups(whichGroup).am045thresholds)/sqrt(pptGroups(whichGroup).n);
    pptGroups(whichGroup).meanSlope045 = mean(pptGroups(whichGroup).am045slopes);
    pptGroups(whichGroup).seSlope045 = std(pptGroups(whichGroup).am045slopes)/sqrt(pptGroups(whichGroup).n);
    pptGroups(whichGroup).meanThreshold135 = mean(pptGroups(whichGroup).am135thresholds);
    pptGroups(whichGroup).seThreshold135 = std(pptGroups(whichGroup).am135thresholds)/sqrt(pptGroups(whichGroup).n);
    pptGroups(whichGroup).meanSlope135 = mean(pptGroups(whichGroup).am135slopes);
    pptGroups(whichGroup).seSlope135 = std(pptGroups(whichGroup).am135slopes)/sqrt(pptGroups(whichGroup).n);
    
end

%% grand stats

trainedThresholds = [ pptGroups(1).am045thresholds pptGroups(2).am135thresholds ];
untrainedThresholds = [ pptGroups(1).am135thresholds pptGroups(2).am045thresholds ];
trainedSlopes = [ pptGroups(1).am045slopes pptGroups(2).am135slopes ];
untrainedSlopes = [ pptGroups(1).am135slopes pptGroups(2).am045slopes ];
trainedMeanThreshold = mean(trainedThresholds);
trainedMeanSlope = mean(trainedSlopes);
trainedSeThreshold = std(trainedThresholds)/sqrt(numel(trainedThresholds));
untrainedMeanThreshold = mean(untrainedThresholds);
untrainedMeanSlope = mean(untrainedSlopes);
untrainedSeThreshold = std(untrainedThresholds)/sqrt(numel(untrainedThresholds));

%% ttests 
trainingThresholdImprovements = untrainedThresholds-trainedThresholds
[h,p,ci,stats] = ttest(trainedThresholds,untrainedThresholds);
thresholdResult = ['t(' num2str(stats.df) ') = ' num2str(stats.tstat,'%0.2f') ', p = ' num2str(p,'%0.3f')]
trainingSlopeImprovements = untrainedSlopes-trainedSlopes
[h,p,ci,stats] = ttest(trainedSlopes,untrainedSlopes);
slopeResult = ['t(' num2str(stats.df) ') = ' num2str(stats.tstat,'%0.2f') ', p = ' num2str(p,'%0.3f')]

%% plot
estParamsTrained =  [trainedMeanThreshold 10.^trainedMeanSlope guessRate lapseRate];
estParamsUntrained =  [untrainedMeanThreshold 10.^untrainedMeanSlope guessRate lapseRate];

figure;hold on;
xMin = 0; xMax = 2; xPlot = linspace(xMin,xMax,200);
line(xPlot,PF(estParamsTrained,xPlot),'Color',[0 0 1],'LineWidth',2)
line(xPlot,PF(estParamsUntrained,xPlot),'Color',[1 0 0],'LineWidth',1)
legend('Stimulated Orientation', 'Non-stimulated Orientation','Location','SouthEast');
%% extra stuff
text(.05,.470,['Threshold: ' thresholdResult]);
text(.05,.44,['Slope: ' slopeResult]);
line([xMin xMax],[.5 .5],'Color',[.7 .7 .7],'LineWidth',.5)
% line([0 0],[0,1],'Color',[.7 .7 .7],'LineWidth',.5)

line(estParamsTrained(1)+[-1 1]*trainedSeThreshold,repmat(PF(estParamsTrained,estParamsTrained(1)),1,2),'Color',[0 0 1],'Marker','+');
line(estParamsUntrained(1)+[-1 1]*untrainedSeThreshold,repmat(PF(estParamsUntrained,estParamsUntrained(1)),1,2),'Color',[1 0 0],'Marker','+');

set(gca,'XLim', [xMin xMax]);
set(gca,'YLim', [.4 1]);
ylabel('Response Proportion');
xlabel('Contrast');
title('Psychometric Function and Fit');
