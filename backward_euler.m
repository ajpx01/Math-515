%% Backward Euler (With Help from Generated Code from MATLAB Copilot) and Scientific Computing with MATLAB and Octave
% Compared Forward Euler code (from Scientific Computing with MATLAB and
% Octave) to generated code, and then edited to this resulting code for full understanding:
function [t,y1]=backward_euler(odefun,tspan,y0,Nh)
w = y0(:);
y1 = w.';
h = (tspan(2) - tspan(1)) / Nh;
tt = linspace(tspan(1), tspan(2), Nh + 1);
for t = tt(1:end-1)
    w = w + h * odefun(t + h, w);
    y1 = [y1; w.']; 
end
t = tt';
end



