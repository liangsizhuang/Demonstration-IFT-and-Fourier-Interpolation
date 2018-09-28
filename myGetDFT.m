function [X, f] = myGetDFT(x, fs, n, freqrange)
% This function returns the DFT and frequency vector for x with a sampling
% frequency of fs. Only the n most strong harmonics are retained. n does
% not count the DC component. If only the DC component is required, use
% n = 0. We count n based on freqrange = 'onesided'.

% x is the input vector. It must be a column vector.
% fs is the sampling frequency.
% n is the number of harmonics to select. n >= 0.
% freqrange must be 'onesided', 'twosided' or 'centered'.

% Default values for inputs.
if ~exist('fs', 'var')
    fs = 1;
end
if ~exist('n', 'var')
    n = floor(length(x)/2); % This is the default value.
end
if ~exist('freqrange', 'var')
    freqrange = 'twosided';
end
c1 = strcmp(freqrange, 'onesided');
c2 = strcmp(freqrange, 'twosided');
c3 = strcmp(freqrange, 'centered');
assert(c1 || c2 || c3);

% Obtain FFT.
N = length(x);
X = fft(x)/N;
% Half of X.
X_H = X(1:floor(N/2)+1);

% Do suppression.
% Obtain indices to sort the mag of FFT.
[~,indices] = sort(abs(X_H(2:end)),'descend');
% We always preserve the DC component.
indices = [1;(indices+1)];
% Suppress components.
X_H(indices(n+2:end)) = 0;
% Reconstruct FFT.
X = X_H;
% Do more if not onesided.
if(~strcmp(freqrange, 'onesided'))
    if mod(N, 2) == 0 % Even
        X = [X; conj(flipud(X_H(2:end-1)))];
    else
        X = [X; conj(flipud(X_H(2:end)))];
    end
    % Shift FFT necessary if centered.
    if strcmp(freqrange, 'centered') % Centered
        X = fftshift(X);
    end
end

% Construct the frequency vector and shift X if necessary.
T = N/fs;
if(strcmp(freqrange, 'onesided'))
    f = 0:floor(N/2);
end
if(strcmp(freqrange, 'twosided'))
    f = 0:N-1;
end
if(strcmp(freqrange, 'centered'))
    if(mod(N,2) == 0)
        f = -N/2:N/2-1; % Even. Bias to the left.
    else
        f = (-N+1)/2:(N-1)/2; % Odd. No bias.
    end
end
f = transpose(f/T);

end