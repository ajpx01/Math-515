% Numerically integrate Lorenz Equations with ODE Solver
b=8/3;
sigma=10;
r=28;

initial_condition1=[5;5;5];
initial_condition2=[5;5;5]+10.^-5;

f1=@(x,y,z) sigma*(y-x);
f2=@(x,y,z) x*(r - z) - y;
f3=@(x,y,z) x*y - b*z;

h=0.001;
tspan=0:h:100;

% Numerically integrate the equations with ode45
% Below Generated with Help from MATLAB Copilot
[t1, sol1] = ode45(@(t, u) [f1(u(1), u(2), u(3)); f2(u(1), u(2), u(3)); f3(u(1), u(2), u(3))], tspan, initial_condition1);

[t2, sol2]= ode45(@(t, u) [f1(u(1), u(2), u(3)); f2(u(1), u(2), u(3)); f3(u(1), u(2), u(3))], tspan, initial_condition2);

% Plot the results of the integration
figure;
% Plot x vs z axis
plot(sol1(:,1), sol1(:,3));
title('2D Lorenz ODE45')
xlabel('x-axis')
ylabel('z-axis')

figure;
plot3(sol1(:,1), sol1(:,2), sol1(:,3));
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Lorenz ODE45');
grid on;

figure;
% Plot x vs z axis
plot(sol2(:,1), sol2(:,3));
xlabel('x-axis')
ylabel('z-axis')
title('2D Lorenz with IC Change ODE45')

figure;
plot3(sol2(:,1), sol2(:,2), sol2(:,3));
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Lorenz with IC Change ODE45');
grid on;

diffx=(sol1(:,1)-sol2(:,1));
diffz=sol1(:,3)-sol2(:,3);
normx=sqrt(diffx.^2);
normz=sqrt(diffz.^2);
figure;
plot(normx,normz)
title('Norm 2D PLot ODE45')
xlabel('x-axis')
ylabel('z-axis')

diffy=sol1(:,2)-sol2(:,2);
normy=sqrt(diffy.^2);
figure;
plot3(normx,normy,normz)
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Norm 3D PLot ODE45')
grid on;













