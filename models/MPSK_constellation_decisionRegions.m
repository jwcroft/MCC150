clf

A = 1;
K = 3; % no of bits
M = 2^K; % no of symbols.

a = pi/4; % Tx phase offset

% Constellation
si = A*exp(i*2*pi*(((1:M)-1)/M) + i*a)

% Circle
t = linspace(0, 1, 100);
hold on; %grid on;
plot(real(A*exp(i*2*pi*t)), imag(A*exp(i*2*pi*t)), '--')
plot(si,'o')


% Decision regions
dr = 1.5*si*exp(i*2*pi*1/(2*M)); % Take constellation points and rotate by half a segment. Draw as lines.
for k=1:M
  plot([0 real(dr(k))], [0 imag(dr(k))], 'r--')
end


axis square; title('MPSK Constellation');
xlabel('Re'); ylabel('Im');