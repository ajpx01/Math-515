% Practice problem from MIT link on Guided Lab 4

% symbolic ODE solver from MATLAB Copilot (Used before)
% Layout of code influenced from MATLAB Class Folder
syms y(t)
Dy = diff(y, t);
ode = Dy==1+y.^2;
exact_ysolution = dsolve(ode, y(0) == 0);

f=@(t,y) 1+y.^2;

y0=0;
t0=0;
tf=2;

Nh=100;
h=(tf-t0)./Nh;
tspan=[t0,tf];

N=101;

[t,u] = rk4(f,tspan,y0,Nh);
[tam,uam] = amonestep(f,tspan,y0,Nh);
[tab,uab] = ab2(f,tspan,y0,Nh);
[theun,uheun] = heunPredictorCorrector(f,tspan,y0,Nh);

Nexact=101;
texact=linspace(t0,tf,Nexact); %set up Nexact evenly spaced time points to compute exact solution
yexact=tan(t); %compute exact solution at texact times

error_rk4=abs(yexact-u);
error_am=abs(yexact-uam);
error_ab=abs(yexact-uab);
error_heun=abs(yexact-uheun);

figure;
loglog(tab,u,'.',texact,yexact)
xlabel('t')
ylabel('y')
legend('RK4','Exact Solution4')

figure;
loglog(texact,error_rk4)
xlabel('t')
ylabel('Error')

figure;
loglog(tam,uam,'--',t,u,'--',tab,uab,'--',theun,uheun,'--',texact,yexact,'k') % Google Gemini to find k is black 
legend('One-Step AM','RK4','AB2','Heun','Exact Solution')


figure;
loglog(tam,error_am,'--',t,error_rk4,'--',tab,error_ab,'--',theun,error_heun,'--')
legend('One-Step AM','RK4','AB2','Heun')
title('Errors')