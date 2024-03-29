clc; clear;

% main function used for this project
syms z
A = 1.7241209734 + 1i*2.8187614099;
f = (sin(cos(z))* exp(z) + A*sinh(z^2));
% f = z^2 - (0.9+0.8i)*z + (0.11+0.27i);
% df = @(z) (-sin(z)*cos(cos(z))*exp(z) + sin(cos(z))*exp(z) + A*2*z*cosh(z^2));
df = diff(f,z);
integral = df / f * (1/(2*pi*1i));

% square_loc
square_loc = [0+0i , 1+0i , 1+1i , 1i];
integral_result = [];
square_result = [];
for i=0:5
    square_loc_temp = [];
    for j=1:size(square_loc,1)
        result = square_search(integral, square_loc(j,:));
        square_loc_temp = [square_loc_temp;result(:,2:end)];
        square_result = [square_result; square_loc];
        integral_result = [integral_result; result(:,1)];
    end
    square_loc = square_loc_temp;
end

z_2 = vpa(mean(square_result(5,:)));
z_1 = vpa(mean(square_result(6,:)));

for i=1:10
    fz_2 = vpa(subs(f,z,z_2));
    fz_1 = vpa(subs(f,z,z_1));
    if (fz_1 == fz_2)
        break;
    end
    z_new = vpa(z_1 - (z_1 - z_2) * fz_1 / (fz_1 - fz_2));
    fprintf('iteration: %d || S: %d || Root: %f+i(%f) \n', i, vpa(subs(f,z,z_new)), real(z_new),imag(z_new));
    z_2 = z_1;
    Z_1 = z_new;
end

