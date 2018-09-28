function x_interp = mySincInterp(t_interp, x, fs)
% This function interpolates x using the sinc interpolation method.
% x is assumed to start at t = 0 with a sampling frequency of fs.

% t is the time to interpolate.
% x is the signal. It must be a column vector.
% fs is the sampling frequency.

N = length(x);
t = (0:N-1)/fs;
[T_interp, T] = ndgrid(t_interp, t);
x_interp = sinc(fs*(T_interp-T))*x;

end