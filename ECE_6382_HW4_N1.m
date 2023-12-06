clc; clear;

N_arr = [1 2 4 8];
r_arr = [0.1 0.01 0.001 0.0001];
f = @(z) 1/(z^2 + sin(z));
res_arr = [0 0 0 0];
fprintf("%6s | %12s | %12s | %12s | %12s\n", "N", "r=0.1" , "r=0.01" , "r=0.001" , "r=0.0001");
for n=1:length(N_arr)
    fprintf("%2.4f ",N_arr(n));
    for r=1:length(r_arr)
        val = evaluate(f,0,r_arr(r), N_arr(n));
        fprintf("| %1.10f ", val);
    end
    fprintf("\n");
end

function residue = evaluate(f, z0, r , N)
    residue = 0;
    for n=1:N
        temp = (r*exp(1i*2*pi*(n-1)/N)) * f(z0 + r*exp(1i*2*pi*(n-1)/N));
        residue = residue + temp;
    end
    residue = residue / N;
end
