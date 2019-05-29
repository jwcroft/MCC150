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
symbolRate = dataRate/3;
wordLength = 12;

memSize = 1024; % Size of memory holding bitstream.

stepSize = 1/sampleRate;
stopTime = 10e3*stepSize;

detection_threshold = 100000; %% Hardcoded???
pilot_bits = [0 0 0 0 0 0 0 0 0 1 1 0 0 0 0]';
pilot_size = length(pilot_bits);
memory_data = [pilot_bits; randsrc(memSize-pilot_size,1,[0 1])]; % BPSK
fir.coeffs = fi(rcosdesign(0.8,5,3*sampleRate/dataRate,'sqrt'), 1, wordLength-2);

barker = [1 1 1 -1 1];
barker_fir = fi(conv(rcosdesign(0.8,5,3*sampleRate/dataRate,'sqrt'),upsample(barker,3*sampleRate/dataRate)));

moving_avg_fir = fi(ones(1,50)/50,1,8);

mapper_LUT_I = [1 0.70710678 0.70710678 0 -0.70710678 0 -1 -0.70710678];
mapper_LUT_Q = [0 0.70710678 -0.70710678 -1 0.70710678 1 0 -0.70710678];

LUT_rx_map = [6 7 3 2 0 1 5 4 6];

LUT_phase = atan(-2^13:1:2^13);

carrierFreq = 5e6;

channel_delay = 119;

%%
stap = datasignaltap;

figure(1)
% subplot(3,1,1)
plot(stap.VarName1,stap.VarName9,'black')
grid on
axis([0 800 -56000 56000])

% subplot(3,1,2)
% plot(stap.VarName1,stap.VarName7,'black')
% grid on
% axis([0 600 100 180])
% 
% subplot(3,1,3)
% plot(stap.VarName1,stap.VarName8,'black')
% grid on
% axis([0 600 100 180])



