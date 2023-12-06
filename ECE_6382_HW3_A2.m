clc; clear; close all;

% Bessel function Y0(-1+i-is) (s is real, 0 < s < 2)

%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%
lower_limit = 0;
upper_limit = 2;
num_sample = 1001;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate Y0
s = linspace(lower_limit, upper_limit, num_sample);
y0 = zeros(size(s));
for u=1:num_sample
    y0(u) = bessely(0, -1+1i-(1i*s(u)) );
end

figure;
subplot(2,1,1);
plot(s,real(y0),'LineWidth',2);
title('Real part of Y0(-1+i-is)');
xlabel('s');
ylabel('Re[Y0]');
grid on;

subplot(2,1,2);
plot(s,imag(y0), 'LineWidth',2);
title('Imaginary part of Y0(-1+i-is)');
xlabel('s');
ylabel('Im[Y0]');
grid on;