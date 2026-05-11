% Flame Example
% With help from https://ocw.mit.edu/courses/res-18-009-learn-differential-equations-up-close-with-gilbert-strang-and-cleve-moler-fall-2015/resources/classical-runge-kutta-ode4/
% and with help from MATLAB Drive class folder
f1=@(t,y) y.^2-y.^3;

t0=0;
y0=0.01;

tf=2./y0; % in this case tf=200
Nh=500;
h=(tf-t0)./Nh;
tspan=[t0,tf];

[t,u] = rk4(f1,tspan,y0,Nh);

N=501;
tpoints=linspace(t0,tf,N); %set up Nexact evenly spaced time points to compute exact solution

figure;
plot(tpoints,u,'.')











