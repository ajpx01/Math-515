% Scientific Computing with MATLAB and Octave
function [t,y1]=feuler(odefun,tspan,y0,Nh)
h=(tspan(2)-tspan(1))/Nh;
y=y0(:);
w=y;
y1=y.';
tt=linspace(tspan(1),tspan(2),Nh+1);
for t=tt(1:end-1)
    w=w+h*odefun(t,w);
    y1=[y1;w.'];
end
t=tt';
return
end
