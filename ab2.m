% From MATH 515 MATLAB Class Folder by Dr. Punit Gandhi
function [t, u] = ab2(f,tspan,y0,Nh,varargin)
 %AB2 
   
      y = y0; %get initial value, should be input as column
      h=(tspan(end)-tspan(1))/Nh; %get step size
      t=linspace(tspan(1),tspan(end),Nh+1); %create time points
      %if varagin is present, assume it contains parameters
      
      N=length(t); %get number of time points
      u=zeros(length(y0),N); %initialize output, each time point is a column
      
      u(:,1) = y; %store initial value as column in output
      ylast=y; %store jj-1 step for AB2
      tlast=t(1);
      %use modified Euler to for additional initial point to use in method
         k1 = f(tlast,ylast,varargin{:}); %estimate slope at t0
         k2 = f(tlast+h/2, ylast+h*k1/2,varargin{:}); %estimate slope at midpoint
         y = ylast + h*k2; %use midpoint slope to step forward
         u(:,2) = y; %store step i column of output
      %carry out AB2 with intial points
      flast=k1;
      for jj = 2:Nh
     
         tnow=t(jj);
         ynow=y;
         fnow=f(tnow,y,varargin{:});
         
         y = ynow + 0.5*h*(3*fnow -flast);
         u(:,jj+1) = y; %store step i column of output
         %tlast=tnow;
         %ylast=ynow;
         flast=fnow;
      end