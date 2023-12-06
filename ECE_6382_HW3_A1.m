clc; clear; close all;

% function: f(s) = ln(-1+i-is) (s is real, 0 < s < 2)

%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%
lower_limit = 0;
upper_limit = 2;
num_sample = 1001;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% calculate f(s) from s
s = linspace(lower_limit, upper_limit, num_sample);
fs = log(-1 + 1i - (1i * s));

% analytic continuation
fs_cont = fs;
for i=1:num_sample
    z = -1 + 1i - (1i * s(i));
    if (angle(z) < 0)
        fs_cont(i) = log(z) + 1i*2*pi;
    end
end

figure;
subplot(4,1,1);
plot(s,real(fs),'LineWidth',2);
title('Real part of f(s)');
xlabel('s');
ylabel('Re[f(s)]');
grid on;

subplot(4,1,2);
plot(s,imag(fs), 'LineWidth',2);
title('Imaginary part of f(s)');
xlabel('s');
ylabel('Im[f(s)]');
grid on;

subplot(4,1,3);
plot(s,real(fs_cont), 'LineWidth',2,'Color','r');
title('Real part of f(s) with analytic continuation');
xlabel('s');
ylabel('Re[f(s)]');
grid on;

subplot(4,1,4);
plot(s,imag(fs_cont), 'LineWidth',2,'Color','r');
title('Imaginary part of f(s) with analytic continuation');
xlabel('s');
ylabel('Im[f(s)]');
grid on;