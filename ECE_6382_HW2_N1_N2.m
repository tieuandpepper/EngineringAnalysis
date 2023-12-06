
% N1
func = @(z) sin(z);
p  = integral(@(z) func(z), 1+1i , 20+30i);
fprintf("N1 solution: %.6g + %.6gi\n",real(p),imag(p));

% N2
func = @(z) sin(z.^2);
p  = integral(@(z) func(z), 1+1i , 2+3i);
fprintf("N2 solution: %.6g + %.6gi\n",real(p),imag(p));
