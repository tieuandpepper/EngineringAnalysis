% Repeat Prob. N3 above using 6-point Gaussian quadrature. Make the same type of table,
% for N = 1, 2, 4, 8, 16, 32, 64.

clc; clear;

func = @(z) sin(z.^2);

% lower limit
a = 1+1i;

% upper limit
b = 2+3i;

% solution
sol = integral(@(z) func(z), a , b);

% number of segments
segments = [1,2,4,8,16,32,64];

% Gaussian sample points and weights
x = [-0.9324695,-0.6612094,-0.2386192,0.2386192,0.6612094,0.9324695];
w = [0.1713245,0.3607616,0.4679139,0.4679139,0.3607616,0.1713245];

for k = 1:length(segments)
    N = segments(k);
    d_z = (b-a)/N;
    sum = 0;
    for j=1:N
        z_mid = a + d_z.*(j - 1/2);
        g_sum = 0;
        for g=1:6
            g_sum = g_sum + (d_z/2)*func(z_mid + x(g)*d_z/2)*w(g);
        end
        sum = sum + g_sum;
    end
    err = 100 * ((abs(sol - sum)) / abs(sol));
    fprintf("%4d || %6.6f + %6.6fi || %6.6f\n",N , real(sum), imag(sum), err);
end
