%MPSK_v2

K = 1; % no of bits
M = 2^K; % no of symbols 

phaseOffset = pi;

sampleRate = 100;

detectionThreshold = 0.5; % Power [W] of signal needed to trigger the sampler/demapper.