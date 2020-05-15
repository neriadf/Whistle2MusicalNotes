function [sSig] = GnrtSigStruct(x, fs)
%GNRTSIGSTRUCT generates a special struct contains useful parameters.

sSig.x = x;
sSig.fs = fs;
sSig.N = length(sSig.x);
sSig.n = 0:(sSig.N-1);
sSig.dt = 1 / sSig.fs;
sSig.t = sSig.n * sSig.dt;
sSig.df = sSig.fs / sSig.N;
sSig.f = sSig.n * sSig.df;
sSig.X = fft(sSig.x);

end

