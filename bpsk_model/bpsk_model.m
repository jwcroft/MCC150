% BPSK model

c = [-1 -i 1 i ];         % Symbols
M = length(c);      

data = randi([0 M-1], 200, 1)              % Generate binary bitstream
modData = genqammod(data, c);            % Modulate data ie. 0 == -1, 1 == 1

modData1 = qammod(randi([0 1],200,1), 2);
modData1 = modData1.*i
scatterplot(awgn(modData1,20,'measured'))

rxSig = awgn(modData,20,'measured');

h = scatterplot(rxSig);
hold on
scatterplot(c,[],[],'r*',h)
grid
hold off

% demodData = qamdemod(rxSig,c);
% [numErrors,ser] = symerr(data,demodData)





% H = comm.BPSKModulator;