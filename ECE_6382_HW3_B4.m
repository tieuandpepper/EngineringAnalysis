clc; clear; close all;
% Sommerfeld branch cuts
% z = x + i*y
% a = a1 + i*a2
% f(z) = (z^2 - a^2)^(1/2)

%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%
limit = 10;
num_sample = 101;
a1 = 1;
a2 = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = linspace(-limit, limit, num_sample);
y = linspace(-limit, limit, num_sample);
boundary = [];
for i=1:num_sample
    for j=1:num_sample
        z = x(i) + 1i * y(j);
        fz = -1i * (z^2 - 1) ^ (1/2);
        if (real(fz) == 0)
            boundary = [boundary, z];
        end
    end
end

scatter(real(boundary), imag(boundary),Marker=".")

xline(0, 'Color', 'k', 'LineWidth', 0.5); % Draw line for Y axis.
yline(0, 'Color', 'k', 'LineWidth', 0.5); % Draw line for X axis.
grid on;
% axis equal;
xlabel('x')
ylabel('y')
