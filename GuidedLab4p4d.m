lambda=1+20i;
f = @(t,y) lambda.*y;
tspan=[0,10];
y0=1;
h=0.1;
Nh=(tspan(end)-tspan(1))./h;


N=101;
tpoints=linspace(tspan(end),tspan(1),N);
solution=exp(t).*(cos(20*t)+1i*sin(20*t));
[t,u]=rk4(f,tspan,y0,Nh);

plot(tpoints,u,tpoints,solution,'--')
legend('RK4','Solution')