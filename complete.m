[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

%% Import VEP One
EEG = pop_readegi('C:\Users\eros030\Desktop\EEG DATA\P31_T1002.RAW', [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','P31_T1002','gui','off'); 
EEG = pop_readegi('C:\Users\eros030\Desktop\EEG DATA\P31_T1003.RAW', [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','P31_T1003','gui','off'); 
EEG = eeg_checkset( EEG );

%% Append VEP One
EEG = pop_mergeset( ALLEEG, [1  2], 0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V1Append','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\P31_V1Append.set','overwrite','on','gui','off'); 

%% Filter VEP One
EEG  = pop_basicfilter( EEG,  1:128 , 'Boundary', 'boundary', 'Cutoff',  [ 0.1 30], 'Design', 'butter', 'Filter', 'bandpass', 'Order',  4 )

%% EGI scalp cap and Ref
EEG=pop_chanedit(EEG, 'load',{'C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\GSN-HydroCel-129.sfp' 'filetype' 'autodetect'},'setref',{'4:132' 'Cz'},'changefield',{132 'datachan' 0});

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V1Filter','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\P31_V1FilterChanLocals.set','gui','off');
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

%% Import VEP Two
EEG = pop_readegi('C:\Users\eros030\Desktop\EEG DATA\P31_T1009.RAW', [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','P31_T1009','gui','off'); 
EEG = pop_readegi('C:\Users\eros030\Desktop\EEG DATA\P31_T1010.RAW', [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','P31_T1010','gui','off'); 
EEG = eeg_checkset( EEG );

%% Append VEP Two
EEG = pop_mergeset( ALLEEG, [1  2], 0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V2Append','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\P31_V2Append.set','overwrite','on','gui','off'); 

%% Filter VEP Two
EEG  = pop_basicfilter( EEG,  1:128 , 'Boundary', 'boundary', 'Cutoff',  [ 0.1 30], 'Design', 'butter', 'Filter', 'bandpass', 'Order',  4 )

%% EGI scalp cap and Ref
EEG=pop_chanedit(EEG, 'load',{'C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\GSN-HydroCel-129.sfp' 'filetype' 'autodetect'},'setref',{'4:132' 'Cz'},'changefield',{132 'datachan' 0});

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V2Filter','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\P31_V2FilterChanLocals.set','gui','off');
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

%% Import VEP Three
EEG = pop_readegi('C:\Users\eros030\Desktop\EEG DATA\P31_T2002.RAW', [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'setname','P31_T2002','gui','off'); 
EEG = pop_readegi('C:\Users\eros030\Desktop\EEG DATA\P31_T2003.RAW', [],[],'auto');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','P31_T2003','gui','off'); 
EEG = eeg_checkset( EEG );

%% Append VEP Three
EEG = pop_mergeset( ALLEEG, [1  2], 0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V3Append','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\P31_V3Append.set','overwrite','on','gui','off'); 

%% Filter VEP Three
EEG  = pop_basicfilter( EEG,  1:128 , 'Boundary', 'boundary', 'Cutoff',  [ 0.1 30], 'Design', 'butter', 'Filter', 'bandpass', 'Order',  4 )

%% EGI scalp cap and Ref
EEG=pop_chanedit(EEG, 'load',{'C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\GSN-HydroCel-129.sfp' 'filetype' 'autodetect'},'setref',{'4:132' 'Cz'},'changefield',{132 'datachan' 0});

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V3Filter','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\P31_V3FilterChanLocals.set','gui','off');
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

eeglab redraw

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

EEG = pop_loadset('filename',{'P31_V1FilterChanLocals.set' 'P31_V2FilterChanLocals.set' 'P31_V3FilterChanLocals.set'},'filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\1_Import,Append,Filter, Channel Locals\\');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'study',0); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'retrieve',1,'study',0); 
EEG = eeg_checkset( EEG );

    [EEG, indelec] = pop_rejchanspec( EEG, 'freqlims', [0.1 30], 'stdthresh', [-3 3], 'plotchans', 'on');
    [ badElecs,votes ] = rejChanLocalAmp( EEG ,5000,10,5);
    indelect = [indelec badElecs];
    
    EEG = pop_interp(EEG,indelect,'Spherical');

EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename','P31_V1Interpolate.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\2_Interpolate\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',2,'study',0); 

    [EEG, indelec] = pop_rejchanspec( EEG, 'freqlims', [0.1 30], 'stdthresh', [-3 3], 'plotchans', 'on');
    [ badElecs,votes ] = rejChanLocalAmp( EEG ,5000,10,5);
    indelect = [indelec badElecs];
    
    EEG = pop_interp(EEG,indelect,'Spherical');
   
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename','P31_V2Interpolate.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\2_Interpolate\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',3,'study',0); 

    [EEG, indelec] = pop_rejchanspec( EEG, 'freqlims', [0.1 30], 'stdthresh', [-3 3], 'plotchans', 'on');
    [ badElecs,votes ] = rejChanLocalAmp( EEG ,5000,10,5);
    indelect = [indelec badElecs];
    
    EEG = pop_interp(EEG,indelect,'Spherical');
   
EEG = eeg_checkset( EEG );
EEG = pop_saveset( EEG, 'filename','P31_V3Interpolate.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\2_Interpolate\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);


eeglab redraw


%% Check to interpolate other channels here


eeglab

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

EEG = pop_loadset('filename','P31_V1Interpolate.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\2_Interpolate\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );

%How many miliseconds do the triggers need to move?
delaySize = 50;

%and leave the rest to me!!!!!!!
samplingRateFix = 1000/EEG.srate;
adjustedDelaySize = delaySize/samplingRateFix;

for j = 1:size(EEG.event,2)
    EEG.event(j).latency = EEG.event(j).latency + adjustedDelaySize;
end

EEG = pop_reref( EEG, [],'refloc',struct('labels',{'Cz'},'Y',{0},'X',{5.4492e-16},'Z',{8.8992},'sph_theta',{0},'sph_phi',{90},'sph_radius',{8.8992},'theta',{0},'radius',{0},'type',{''},'ref',{'Cz'},'urchan',{132},'datachan',{0}));

EEG = pop_saveset( EEG, 'filename','P31_V1CorTrigReRef.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\5_CorTrig, Re-reference\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

clc
clear all
eeglab


EEG = pop_loadset('filename','P31_V2Interpolate.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\2_Interpolate\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );

%How many miliseconds do the triggers need to move?
delaySize = 50;

%and leave the rest to me!!!!!!!
samplingRateFix = 1000/EEG.srate;
adjustedDelaySize = delaySize/samplingRateFix;

for j = 1:size(EEG.event,2)
    EEG.event(j).latency = EEG.event(j).latency + adjustedDelaySize;
end

EEG = pop_reref( EEG, [],'refloc',struct('labels',{'Cz'},'Y',{0},'X',{5.4492e-16},'Z',{8.8992},'sph_theta',{0},'sph_phi',{90},'sph_radius',{8.8992},'theta',{0},'radius',{0},'type',{''},'ref',{'Cz'},'urchan',{132},'datachan',{0}));

EEG = pop_saveset( EEG, 'filename','P31_V2CorTrigReRef.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\5_CorTrig, Re-reference\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

clc
clear all
eeglab

EEG = pop_loadset('filename','P31_V3Interpolate.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\2_Interpolate\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );

%How many miliseconds do the triggers need to move?
delaySize = 50;

%and leave the rest to me!!!!!!!
samplingRateFix = 1000/EEG.srate;
adjustedDelaySize = delaySize/samplingRateFix;

for j = 1:size(EEG.event,2)
    EEG.event(j).latency = EEG.event(j).latency + adjustedDelaySize;
end

EEG = pop_reref( EEG, [],'refloc',struct('labels',{'Cz'},'Y',{0},'X',{5.4492e-16},'Z',{8.8992},'sph_theta',{0},'sph_phi',{90},'sph_radius',{8.8992},'theta',{0},'radius',{0},'type',{''},'ref',{'Cz'},'urchan',{132},'datachan',{0}));

EEG = pop_saveset( EEG, 'filename','P31_V3CorTrigReRef.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\5_CorTrig, Re-reference\\');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

clc
clear all
eeglab

eeglab

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

EEG = pop_loadset('filename',{'P31_V1CorTrigReRef.set' 'P31_V2CorTrigReRef.set' 'P31_V3CorTrigReRef.set'},'filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\5_CorTrig, Re-reference\\');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'study',0); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'retrieve',1,'study',0); 
EEG = eeg_checkset( EEG );

%% Extract epochs of interest
EEG = pop_epoch( EEG, {  'S045'  'S135'  }, [-0.1         0.5], 'newname', 'P31_V1Epoch', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\6_Epochs\\P31_V1Epoch.set','overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',2,'study',0); 

EEG = pop_epoch( EEG, {  'S045'  'S135'  }, [-0.1         0.5], 'newname', 'P31_V2Epoch', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\6_Epochs\\P31_V2Epoch.set','overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',3,'study',0); 

EEG = pop_epoch( EEG, {  'S045'  'S135'  }, [-0.1         0.5], 'newname', 'P31_V3Epoch', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\6_Epochs\\P31_V3Epoch.set','overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

eeglab

eeglab
%%
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

EEG = pop_loadset('filename',{'P31_V1Epoch.set' 'P31_V2Epoch.set' 'P31_V3Epoch.set'},'filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\6_Epochs\\');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'study',0); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'retrieve',1,'study',0); 
EEG = eeg_checkset( EEG );

%% Reject artifacts
[EEG, baddies] = pop_eegthresh(EEG,1,[1:128] ,-100,100,-0.1,0.499,2,0);
EEG = eeg_rejsuperpose( EEG, 1, 1, 1, 1, 1, 1, 1, 1);

EEG = pop_rejepoch( EEG, baddies, 0);

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','P31_V1ArtReject','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\7_Artifact rejection\\P31_V1ArtReject.set','overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'retrieve',2,'study',0); 

[EEG, baddies] = pop_eegthresh(EEG,1,[1:128] ,-100,100,-0.1,0.499,2,0);
EEG = eeg_rejsuperpose( EEG, 1, 1, 1, 1, 1, 1, 1, 1);

EEG = pop_rejepoch( EEG, baddies, 0);

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','P31_V2ArtReject','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\7_Artifact rejection\\P31_V2ArtReject.set','overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',3,'study',0); 

[EEG, baddies] = pop_eegthresh(EEG,1,[1:128] ,-100,100,-0.1,0.499,2,0);
EEG = eeg_rejsuperpose( EEG, 1, 1, 1, 1, 1, 1, 1, 1);

EEG = pop_rejepoch( EEG, baddies, 0);

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'setname','P31_V3ArtReject','savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\7_Artifact rejection\\P31_V3ArtReject.set','overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

eeglab

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','P31_V1ArtReject.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\7_Artifact rejection\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S045'  }, [-0.1         0.5], 'newname', 'P31_V1_045', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\8_Orientations\\P31_V1_045.set','gui','off'); 
EEG = eeg_checkset( EEG );

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',1,'study',0); 

EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S135'  }, [-0.1         0.5], 'newname', 'P31_V1_135', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\8_Orientations\\P31_V1_135.set','gui','off'); 
EEG = eeg_checkset( EEG );

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];


EEG = pop_loadset('filename','P31_V2ArtReject.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\7_Artifact rejection\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S045'  }, [-0.1         0.5], 'newname', 'P31_V2_045', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\8_Orientations\\P31_V2_045.set','gui','off'); 
EEG = eeg_checkset( EEG );

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',1,'study',0); 

EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S135'  }, [-0.1         0.5], 'newname', 'P31_V2_135', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\8_Orientations\\P31_V2_135.set','gui','off'); 
EEG = eeg_checkset( EEG );

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];


EEG = pop_loadset('filename','P31_V3ArtReject.set','filepath','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\7_Artifact rejection\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );

EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S045'  }, [-0.1         0.5], 'newname', 'P31_V3_045', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\8_Orientations\\P31_V3_045.set','gui','off'); 
EEG = eeg_checkset( EEG );

[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'retrieve',1,'study',0); 

EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'S135'  }, [-0.1         0.5], 'newname', 'P31_V3_135', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew','C:\\Users\\eros030\\Desktop\\EEG DATA\\EEGLAB\\8_Orientations\\P31_V3_135.set','gui','off'); 
EEG = eeg_checkset( EEG );

STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
