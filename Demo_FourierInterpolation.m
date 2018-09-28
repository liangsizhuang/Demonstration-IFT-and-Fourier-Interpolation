% Prepare the signal.
x = importdata('audio_data.wav');
fs = x.fs;
x = x.data(7001:7001+256-1,2);

% Obtain interpolation.
N = length(x);
t = (0:N-1)/fs;
t_interp = 0:max(t)/(10*N):max(t);
[X, f] = myGetDFT(x, fs, [], 'onesided');
x_dft_interp = myIFS(t_interp, X, f);
x_sinc_interp = mySincInterp(t_interp, x, fs);

% Plot results.
figure(1);
plot(t_interp, x_dft_interp,'.');
hold on;
plot(t_interp, x_sinc_interp, '-');
hold off;
xlabel('Time (s)');
title('Fourier Interpolation vs Sinc Interpolation');
legend({'Fourier Interp','Sinc Interp'});