% Macro Project MCC150

%===========================%
% Modulation format: 8-PSK
% Data rate: 1MBaud
% Sample rate (clock rate): 40MHz
% Word Length: 12 bit
%===========================%

clockRate  = 40e6; % Clock rate of the FPGA device
dataRate   = 10e6;   % data rate of the OOK signal
sampleRate = clockRate;     % Sample rate of the signal
wordLength = 12;

pilot_size = 2;
memSize = 1024; % Size of memory holding bitstream.

stepSize = 1/sampleRate;
stopTime = 10e3*stepSize;

detection_threshold = 100; %% Hardcoded???

memory_data = [0;1; randsrc(memSize-pilot_size,1,[0 1])]; % BPSK
fir.coeffs = fi(rcosdesign(0.8,4,3*sampleRate/dataRate,'sqrt'), 1, wordLength-2); 

mapper_LUT_I = [1 0.70710678 0.70710678 0 -0.70710678 0 -1 -0.70710678];
mapper_LUT_Q = [0 0.70710678 -0.70710678 -1 0.70710678 1 0 -0.70710678];

carrierFreq = 5e6;

