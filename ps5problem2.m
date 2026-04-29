% Layout of code was derived from code in MATLAB online class folder, but
% edited to address this problem. Including additional graphs

% symbolic ODE solver from MATLAB Copilot
syms y(t)
Dy = diff(y, t);
ode = Dy==(4*t*sqrt(t+y.^2))./y;
exact_ysolution = dsolve(ode, y(0) == 1);

% Define ODE
f=@(t,y) (4*t*sqrt(t+y.^2))./y;

t0=0; % Initial Point
tN=5; % Final Point

y0=1; % Initial Condition

fprintf('Exact Solution = (4*t^4 + 4*t^2 - t + 1)^(1/2)')

Nexact=101;
texact=linspace(t0,tN,101); %set up Nexact evenly spaced time points to compute exact solution
yexact=(4*texact.^4 + 4*texact.^2 - texact + 1).^(1/2); %compute exact solution at texact times

Nh=100; %number of steps
h= (tN-t0)./Nh; %step size
tspan=[t0,tN];

[tab2, uab2] = ab2(f,tspan,y0,Nh);
[trk2,urk2] = rk2(f,tspan,y0,Nh);
[tam,uam]=amonestep(f,tspan,y0,Nh);
[theun,uheun]=heunPredictorCorrector(f,tspan,y0,Nh);

figure;
subplot(2,1,1)
hold on
%subplot(2,1,1)
plot(texact,yexact,'-')
title('Two-Step Adams-Bashforth')
plot(tab2,uab2,'--')
subplot(2,1,2)
hold on
title('AB2 Error')
plot(tab2,abs(yexact-uab2))
xlabel('t')
ylabel('error')


figure;
subplot(2,1,1)
hold on
%subplot(2,1,1)
plot(texact,yexact,'-')
title('RK2')
plot(trk2,urk2,'--')
subplot(2,1,2)
hold on
title('RK2 Error')
plot(trk2,abs(urk2-yexact))
xlabel('t')
ylabel('error')

figure;
subplot(2,1,1)
hold on
%subplot(2,1,1)
plot(texact,yexact,'-')
title('AM')
plot(tam,uam,'--')
subplot(2,1,2)
hold on
title('AM Error')
plot(trk2,abs(uam-yexact))
xlabel('t')
ylabel('error')

figure;
subplot(2,1,1)
hold on
%subplot(2,1,1)
plot(texact,yexact,'-')
title('Heun')
plot(theun,uheun,'--')
subplot(2,1,2)
hold on
title('Heun Error')
plot(theun,abs(uheun-yexact))
xlabel('t')
ylabel('error')

error_rk2=abs(urk2-yexact);
error_ab2=abs(uab2-yexact);
error_am=abs(uam-yexact);
error_heun=abs(uheun-yexact);


figure;
hold on
loglog(texact,error_rk2,'-',texact,error_ab2,'--',texact,error_am,texact,error_heun,'b')
ylabel('Error')
xlabel('t')
legend('AB2','RK2','AM','Heun')
% Method Below is from Mathworks: https://www.mathworks.com/matlabcentral/answers/33779-zooming-a-portion-of-figure-in-a-figure
axes('Position',[.65 .175 .25 .25])
box on
interval_interest=(5.0>=texact) & (texact>=4.8);
loglog(texact(interval_interest),error_rk2(interval_interest),'-',texact(interval_interest),error_ab2(interval_interest),'--',texact(interval_interest),error_heun(interval_interest),'b')
axis tight
legend('AB2','RK2','Heun')

max_err_rk2=max(abs(urk2-yexact))
max_err_ab2=max(abs(uab2-yexact))
max_err_heun=max(abs(uheun-yexact))
max_err_am=max(abs(uam-yexact))

