clc; clear;

N_arr = [1 2 4 8];
b_arr = [pi 0.9*pi];
f = @(z) (sin(z))^2;

answer = [0 0];
err = [0 0];

fprintf("%5s | %10s | %11s || %10s | %11s \n","N","b = pi", "% Error", "b = 0.9pi", "% error");
for n=1:length(N_arr)
    for b=1:length(b_arr)
        ans(b) = midpt_rule(f, b_arr(b) , N_arr(n));
        err(b) = get_error(ans(b), get_exact(b_arr(b)));
    end
    fprintf("%1.3f | %1.8f | % 11.6f || %1.8f | %11.6f\n", n , ans(1), err(1),ans(2),err(2));
end

% Midpoint rule calculation
function sum = midpt_rule(f,b,N)
    a = 0;
    d_z = (b-a)/N;
    sum = 0;
    for j=1:N
        z_mid = a + d_z.*(j - 1/2);
        sum = sum + d_z * f(z_mid);
    end
end

% Get exact value
function res = get_exact(b)
    res = (b/2) * (1 - (sin(2*b)/(2*b)));
end

% Retrieve error %
function err = get_error(real, theoretical)
    err = (real - theoretical) * 100 / theoretical;
end