%MPSK sample based signals

K = 1; % no of bits
M = 2^K; % no of symbols 

% Simulink params.
stopTime = 1;
sampleRate = 100;
sampleTime = 1/sampleRate; 
clockRate = 1000;
clockTime = 1/clockRate;

samplesPerSymb = 10;

phaseOffset = pi;

frameLength = 100;


preambleLength = 3;

detectionThreshold = 0.5; % Power [W] of signal needed to trigger the sampler/demapper.


preamble   = [0 1 0]';
bitstreamStruct.signals.values  = boolean( [preamble; randsrc(sampleRate*stopTime+1-size(preamble,1),1,[0:M-1])] );
bitstreamStruct.time = (0:sampleTime:stopTime)';
% bitstreamStruct. =  [timeStamps  bitstream];