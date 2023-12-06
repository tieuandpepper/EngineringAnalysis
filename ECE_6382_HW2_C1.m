clc; clear;

first_val = -7;
last_val = 7;
increment = 0.01;
x = first_val : increment : last_val;
y = first_val : increment : last_val;

phi = zeros(length(x),length(y));
u = zeros(length(x),length(y));
v = zeros(length(x),length(y));

for i=1:length(x)
    for j = 1:length(y)
        if (x(i) < 1) && (x(i) > -1)
            phi(i,j) = 1;
        elseif (x(i) == 1 || x(i) == -1)
            phi(i,j) = Inf;
        end

        if (x(i)+1)^2 + y(j)^2 == 0
            u(i,j) = Inf;
        else
            u(i,j) = log(((x(i)-1)^2 + y(j)^2)/((x(i)+1)^2 + y(j)^2));
        end

        if x(i)^2 + y(j)^2 -1 == 0
            v(i,j) = pi/2;
        else
            v(i,j) = atan(y(j)/(x(i)-1)) - atan(y(j)/(x(i)+1));
            if (v(i,j) < 0)
                v(i,j) = pi+v(i,j);
            end
        end

    end
end
% figure;
% plot3(x,y,phi, LineWidth=1)
% grid on
% xlabel('x')
% ylabel('y')
% zlabel('phi')

figure;
% plot3(u,v,phi)
plot(u,v)
grid on
xlabel('u')
% xlim([-5 5])
yticks([0 pi/2 pi])
yticklabels({'0' , 'pi/2', 'pi'})
ylabel('v')
ylim([0 pi])
% zlabel('phi')