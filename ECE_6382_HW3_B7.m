clc; clear; close all;

r0 = 15;
re = linspace(-r0, r0, 31).';                           % create a matrix of complex inputs
im = linspace(-r0, r0, 31);
z = re + 1j*im;
theta = angle(z);  % atan2(imag(z), real(z));
r = abs(z);

% concatenate the same mesh twice (plotting trick) back to back, insert nan in between
w1 = nthroot(r,3).*exp(1i*theta/2); % first branch
w2 = nthroot(r,3).*exp(1i*(theta+2*pi)/2); % second branch
w3 = nthroot(r,3).*exp(1i*(theta+4*pi)/3); % third branch

z = [z, nan(size(w1,1),1), z,nan(size(w1,1),1)];
w = [w1, nan(size(w1,1),1), w2, nan(size(w1,1),1)];

figure('Name','Graphique complexe','units','normalized','outerposition',[ 0.08 0.1 0.8 0.55]);
subplot(121)
surf(real(z),imag(z),real(w),imag(w))    % visualize the complex function using surf
xlabel('Real(z)')
ylabel('Imag(z)')
zlabel('Real(u)')
cb = colorbar;
colormap jet;                            % gradient from blue to red
cb.Label.String = 'Imag(v)';

subplot(122)
surf(real(z),imag(z),imag(w),real(w))    % visualize the complex function using surf
xlabel('Real(z)')
ylabel('Imag(z)')
zlabel('Imag(v)')
cb = colorbar;
colormap jet;                            % gradient from blue to red
cb.Label.String = 'Real(u)';