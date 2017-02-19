# dssr2017-EricAuckland

# Introduction
Hello fellow researcher, I hope you have a fortuitous time with this program!
This semi-automatised pre-processing pipeline for NetStation EEG data aims to 1) Pre-process your data in a quick and simple fashion or to 2) Pre-process your data in a more customisable fashion.

# What this does
This software will ATTEMPT to condition your EEG data to the point at which you can use it for statistical analysis.
You will be presented with two options. The quick or the difficult...
The quick method involves little user input, you will only need to input electrodes of interest (these will be clustered together), triggers, the trigger latency difference, and the epoch length. 
The difficult method involves all of the above, however you can specify parameters for filtering, interpolation and artefact rejection.

# Files, programs and toolboxes required
You SHOULD have a number of files from NetStation that you can work with. These are .RAW files which will be re-saved and converted into .set files.
You WILL need MATLAB, the EEGLAB, ERPLAB and Statistics and Machine Learning toolboxes.

# How to begin
Make a folder on your system, the desktop is a fine place.
Place your NetStation file/s in this folder.
Copy and paste the EEG_PPPipeline folder into the aforementioned folder.
Double click the EEG_PPPipeline folder and right click the ????. m file and 'run'
You will then need to choose which option you want. Either 'quick' or 'difficult' which are oulined above.
Depending on which method you choose you will need to input some values.
Once you have filled in all the parameters, the script will run through your data. This could take some time depending on how large your file/s are.
The output file will consist of an array with time (ms) on columns, and electrode/s as a row. 
If all goes well, a figure should be plotted :).
