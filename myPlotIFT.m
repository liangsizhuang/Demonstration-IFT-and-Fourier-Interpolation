function myPlotIFT(x, fs, n)
% This function plots the invers DFT of x using n harmonics of X = fft(x).
% This function also plots the inverse FS on X[k] using n harmonics of X = fft(x).

% x is the input vector. It must be a column vector.
% fs is the sampling frequency.
% n is the number of harmonics to use.

% Figure 1: Plot DFT (or FS).
figure(1);
[X, f] = myGetDFT(x, fs, [], 'centered');
stem(f,abs(X), '.-');
hold on;
[Xn, fn] = myGetDFT(x, fs, n, 'centered');
fn(Xn == 0) = [];
Xn(Xn == 0) = [];
plot(fn,abs(Xn), 'rx');
hold off;
xlabel('Frequency (Hz)');
ylabel('|DFT|');
title('Discrete Fourier Transform');
legend({'All', 'Selected'});

% Figure 2: Inverse DFT with n harmonics.
figure(2);
N = length(x);
t = (0:N-1)/fs;
for i = 1:n+1
    X = myGetDFT(x, fs, i-1);
    x_r_dft = N*ifft(X);
    subplot(n+1,1,i);
    plot(t, x, '.-');
    hold on;
    plot(t, x_r_dft,'.-');
    hold off;
    xlim([0 max(t)]);
    ylabel(['n = ' num2str(i-1)]);
end
xlabel('Time (s)');
subplot(n+1,1,1);
title('Inverse DFT with n Harmonics');

% Figure 3: Inverse FS with n harmonics.
figure(3);
t_interp = 0:max(t)/(10*N):max(t);
for i = 1:n+1 % i-1 is now the new n.
    [X, f] = myGetDFT(x, fs, i-1, 'onesided');
    x_r_fs = myIFS(t_interp, X, f);
    subplot(n+1,1,i);
    plot(t, x, '.-');
    hold on;
    plot(t_interp, x_r_fs,'.-');
    hold off;
    xlim([0 max(t)]);
    ylabel(['n = ' num2str(i-1)]);
end
xlabel('Time (s)');
subplot(n+1,1,1);
title('Inverse FS with n Harmonics');

end