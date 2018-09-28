% Prepare the signal.
x = importdata('audio_data.wav');
fs = x.fs;
x = x.data(7001:7001+1024-1,2);
n = 4; % Number of harmonics to use.

% Plot DFT and FS reconstruction.
myPlotIFT(x, fs, n);