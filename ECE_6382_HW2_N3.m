clc; clear;

%{
Evaluate numerically the above integral in Prob. N2 by using a straight-line path and the
midpoint rule. Use the following number of segments: N = 1, 2, 4, 8, 16, 32, 64. Make a
table that summarizes the real and imaginary parts of the result for each N (denoted here as
IN) and the percent error between IN and the exact result I
%}

func = @(z) sin(z.^2);

% lower limit
a = 1+1i;
% upper limit
b = 2+3i;

p = integral(@(z) func(z), a, b);

% number of segments
segments = [1,2,4,8,16,32,64];
for k = 1:length(segments)
    N = segments(k);
    d_z = (b-a)./N;
    sum = 0;
    for j=1:N
        z_mid = a + d_z.*(j - 1/2);
        sum = sum + d_z * func(z_mid);
    end
    err = 100 * ((abs(p - sum)) / abs(p));
    fprintf("%4d || %6.6f + %6.6fi || %6.6f\n",N , real(sum), imag(sum), err);
end