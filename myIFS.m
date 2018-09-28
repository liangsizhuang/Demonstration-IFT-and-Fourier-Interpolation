function x_r = myIFS(t, c, f)
% This function calculates the inverse FS of (X, f) at t.
% (X, f) MUST BE IN THE ONESIDED FORM.

% t is the time to interpolate.
% X is the FS.
% f is the corresponding frequency of X.

A = abs(c);
theta = angle(c);

% Multiply by 2 when necessary.
N = length(c);
if mod(N, 2) == 0 % even
    A(2:end-1) = 2*A(2:end-1);
else % odd
    A(2:end) = 2*A(2:end);
end

% Suppress empty spectral lines.
f(c == 0) = [];
A(c == 0) = [];
theta(c == 0) = [];

x_r = 0;
for j = 1:length(f)
    x_r = x_r + A(j)*cos(2*pi*f(j)*t+theta(j));
end

end