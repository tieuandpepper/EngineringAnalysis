% 6-point Gaussian quadrature
function sum = gaussian_quad(f, lower, upper)
% func = @(z) sin(z);
% 
% % lower limit
% a = 0;
% 
% % upper limit
% b = 5/4*pi;

func = f;
a = lower;
b = upper;
% solution
% sol = integral(@(z) func(z), a , b);

% Gaussian sample points and weights
x = [-0.9324695,-0.6612094,-0.2386192,0.2386192,0.6612094,0.9324695];
w = [0.1713245,0.3607616,0.4679139,0.4679139,0.3607616,0.1713245];
N = 10;

d_z = (b-a)/N;
sum = 0;
for j=1:N
    z_mid = a + d_z.*(j - 1/2);
    g_sum = 0;
    for g=1:6
        val = vpa((d_z/2)*func(z_mid + x(g)*d_z/2)*w(g));
        g_sum = vpa(g_sum + val);
    end
    sum = sum + g_sum;
end
% err = 100 * ((abs(sol - sum)) / abs(sol));
% fprintf("%4d || %6.6f + %6.6fi || %6.6f\n",N , real(sum), imag(sum), err);
end