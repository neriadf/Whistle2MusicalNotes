function [] = PlotSpec(f, X)
%PLOTSPEC plots the power of the signal in frequency domain.

X = abs(X).^2;
figure;
plot(f*1e-3, X);
title('Signal Spectrum');
xlabel('frequency [kHz]');
ylabel('Power');

end

