% Define the equation
equation = @(x, y) (4*x^3*y - 4*y^3*x);

% Create a grid of x and y values
[x, y] = meshgrid(-2:0.01:2, -2:0.01:2);

% Evaluate the equation for each combination of x and y
z = equation(x, y);

% Plot the equation using ezplot
figure;
ezplot(equation, [-2 2 -2 2]);

% Add labels and title
xlabel('x');
ylabel('y');

% Add a grid for better visualization
grid on;