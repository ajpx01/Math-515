f = @(t,y) 1-y+exp(2*t)*y.^2;

y0=0;
tspan=[0 0.9];
h=0.1; % step size
Nh=(tspan(2)-tspan(1))./h;

nexact=10;
texact=linspace(tspan(1),tspan(2),10);
uexact=exp(-texact).*tan(exp(texact)-1);
x=uexact;

[t,u]=rk4(f,tspan,y0,Nh);
w=u

err=abs(x-w)









