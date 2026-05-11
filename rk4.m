% Most of code is derived from Class Folder RK2 Method, but equations in
% loop needed to change in order to represent RK4
function [t, u] = rk4(f,tspan,y0,Nh,varargin)
   
      y = y0; %get initial value, should be input as column
      h=(tspan(end)-tspan(1))/Nh; %get step size
      t=linspace(tspan(1),tspan(end),Nh+1); %create time points
      %if varagin is present, assume it contains parameters
      
      N=length(t); %get number of time points
      u=zeros(length(y0),N); %initialize output, each time point is a column
      
      u(:,1) = y; %store initial value as column in output
      
      for jj = 1:(N-1) %loop through time points
         tnow=t(jj);
         k1 = h*f(tnow,y,varargin{:}); 
         k2 = h*f(tnow+h/2, y+k1/2,varargin{:}); 
         k3= h*f(tnow+h/2,y+k2/2,varargin{:});
         k4= h*f(tnow+h,y+k3,varargin{:});
         y=y+(1/6)*(k1+2*k2+2*k3+k4);
         u(:,jj+1) = y; %store step i column of output
      end




      