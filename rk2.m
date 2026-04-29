 % From MATH 515 MATLAB Class Folder by Dr. Punit Gandhi
function [t, u] = rk2(f,tspan,y0,Nh,varargin)
 %RK2 
   
      y = y0; %get initial value, should be input as column
      h=(tspan(end)-tspan(1))/Nh; %get step size
      t=linspace(tspan(1),tspan(end),Nh+1); %create time points
      %if varagin is present, assume it contains parameters
      
      N=length(t); %get number of time points
      u=zeros(length(y0),N); %initialize output, each time point is a column
      
      u(:,1) = y; %store initial value as column in output
      
      for jj = 1:(N-1) %loop through time points
         tnow=t(jj);
         k1 = f(tnow,y,varargin{:}); %estimate slope at t
         k2 = f(tnow+h/2, y+h*k1/2,varargin{:}); %estimate slope at midpoint
         y = y + h*k2; %use midpoint slope to step forward
         u(:,jj+1) = y; %store step i column of output
      end
