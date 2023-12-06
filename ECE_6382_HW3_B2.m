clc; clear; close all;

limit = 10;
x = linspace(-limit,limit,201);
y = linspace(-limit,limit,201);

neg_real = [];
pos_real = [];
zero = [];

for i=1:200
    for j=1:200
        if ((x(i) <= 1 && x(i) >= -1 )&& y(j) == 0)
            continue;
        end
        z = x(i) + 1i*y(j);
        z1 = z - 1;
        z2 = z + 1;
        
        angle_z1 = angle(z1);
        if (angle_z1 < 0)
            angle_z1 = angle_z1 + 2*pi;
        end
        angle_z2 = angle(z2);
        if (angle_z2 < 0)
            angle_z2 = angle_z2 + 2*pi;
        end
        fz = sqrt(abs(z1))* sqrt(abs(z2)) * exp(1i*(angle_z1/2)) * exp(1i*(angle_z2/2));
        % fz = (z1)^(1/2) * z2^(1/2);
        % fz = (z^2 - 1)^(1/2);
        if (real(fz) < 0)
            neg_real = [neg_real, z];
        elseif (real(fz) > 0)
            pos_real = [pos_real, z];
        else
            zero = [zero, z];
        end
    end
end


scatter(real(neg_real),imag(neg_real),".", 'r');
hold on
scatter(real(pos_real),imag(pos_real),".",'g');
hold on
scatter(real(zero),imag(zero),"o", 'b');
xline(0, 'Color', 'k', 'LineWidth', 0.5); % Draw line for Y axis.
yline(0, 'Color', 'k', 'LineWidth', 0.5); % Draw line for X axis.
axis equal
grid on
xlabel("Re(z)")
ylabel("Im(z)")

