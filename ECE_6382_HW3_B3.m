clc; clear; close all;
% Sommerfeld branch cuts
% z = x + i*y
% a = a1 + i*a2
% f(z) = (z^2 - a^2)^(1/2)

%%%%%%%%%%%% INPUTS %%%%%%%%%%%%%%%%%%%
limit = 10;
num_sample = 10001;
a1 = 1;
a2 = -1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = linspace(-limit, limit, num_sample);

boundary_1 = [];

for i=1:length(x)
    y = a1*a2/x(i);
    if (x(i)^2 - y^2 < a1^2 - a2^2)
        boundary_1 = [boundary_1, x(i) + 1i*y];
    end
end

boundary_2 = [];
for i=1:length(x)
    y = a1*a2/x(i);
    if (y^2 - x(i)^2 < a1^2 - a2^2)
        boundary_2 = [boundary_2, y + 1i*x(i)];
    end
end
% scatter(real(boundary), imag(boundary),Marker=".")
plot(real(boundary_1), imag(boundary_1),real(boundary_2), imag(boundary_2))
xline(0, 'Color', 'k', 'LineWidth', 0.5); % Draw line for Y axis.
yline(0, 'Color', 'k', 'LineWidth', 0.5); % Draw line for X axis.
grid on;
% axis equal;
xlabel('x')
ylabel('y')
