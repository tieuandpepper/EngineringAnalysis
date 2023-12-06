clc; clear;

M = [1    1+1i   1+2i;
     1-1i  2     1+3i;
     1-2i  1-3i    3];

% get eigenvectors and eigenvectors
[E, D] = eig(M);
fprintf("Eigenvalues: \n");
disp(diag(D));

e1 = E(:,3);
e2 = E(:,2);
e3 = E(:,1);

fprintf("Eigenvectors: \n");
disp(E);

% normalize by the first element
e1_norm = e1 / e1(1);
e2_norm = e2 / e2(1);
e3_norm = e3 / e3(1);

% normalize by magnitude
e1_norm = e1_norm / norm(e1_norm);
e2_norm = e2_norm / norm(e2_norm);
e3_norm = e3_norm / norm(e3_norm);
fprintf("normalized e1: \n");
disp(e1_norm);
fprintf("normalized e2: \n");
disp(e2_norm);
fprintf("normalized e3: \n");
disp(e3_norm);

fprintf("Inner product between e1 and e2: %f\n", dot(e1_norm,e2_norm));
fprintf("Inner product between e1 and e3: %f\n", dot(e1_norm,e3_norm));
fprintf("Inner product between e2 and e3: %f\n", dot(e2_norm,e3_norm));
