function hpol =my_polar(theta,rho,line_style,minr,maxr)
%   Ning  modified the original function
%    line_style is the pattern of the line  (eg. '-r')
%   "minr"  "maxr" are the least R scale and the largest R scale
%   you can input 1, 2 ,3,4 or 5 arguments
%   the unit of theta is rad.
%   if the value of minr and maxr is not fitting the value of rho, the pic is ugly
%
%   1 argument:  rho
%   2 arguments: theta , rho
%   3 arguments: theta, rho, line_sytle
%   4 arguments: theta,rho,minr,maxr  (better)
%   5 arguments: theta ,rho, line_style ,minr, maxr  (better)
%POLAR  Polar coordinate plot.
%   POLAR(THETA, RHO) makes a plot using polar coordinates of
%   the angle THETA, in radians, versus the radius RHO.
%   POLAR(THETA,RHO,S) uses the linestyle specified in string S.
%   See PLOT for a description of legal linestyles.
%
%   See also PLOT, LOGLOG, SEMILOGX, SEMILOGY.
%   Copyright (c) 1984-97 by The MathWorks, Inc.
%   $Revision: 5.14 $  $Date: 1997/04/08 06:08:56 $
if nargin < 1
   error('Requires 1, 2 or 3 or 5 input arguments.')
elseif nargin==4
   if isstr(line_style)
      error('Not match input arguments. ')
   else 
      maxr=minr;
      minr=line_style;
      line_style = 'auto';
   end
   
elseif nargin == 2 
    if isstr(rho)
        line_style = rho;
        rho = theta;
        [mr,nr] = size(rho);
        if mr == 1
            theta = 1:nr;
        else
            th = (1:mr)';
            theta = th(:,ones(1,nr));
        end
    else
        line_style = 'auto';
    end
elseif nargin == 1
    line_style = 'auto';
    rho = theta;
    [mr,nr] = size(rho);
    if mr == 1
        theta = (1:nr)*pi/180;
    else
        th = (1:mr)';
        theta = th(:,ones(1,nr));
    end
 end%end if nargin<1
 
 %h=axes('position',[200,200,600,600])
 %delete(h)
if isstr(theta) | isstr(rho)
    error('Input arguments must be numeric.');
end
 
if ~isequal(size(theta),size(rho))
    error('THETA and RHO must be the same size.');
end
% get hold state
cax = newplot;
next = lower(get(cax,'NextPlot'));
hold_state = ishold;
% get x-axis text color so grid is in same color
tc = get(cax,'xcolor');
ls = get(cax,'gridlinestyle');
% Hold on to current Text defaults, reset them to the
% Axes' font attributes so tick marks use them.
fAngle  = get(cax, 'DefaultTextFontAngle');
fName   = get(cax, 'DefaultTextFontName');
fSize   = get(cax, 'DefaultTextFontSize');
fWeight = get(cax, 'DefaultTextFontWeight');
fUnits  = get(cax, 'DefaultTextUnits');
set(cax, 'DefaultTextFontAngle',  get(cax, 'FontAngle'), ...
    'DefaultTextFontName',   get(cax, 'FontName'), ...
    'DefaultTextFontSize',   get(cax, 'FontSize'), ...
    'DefaultTextFontWeight', get(cax, 'FontWeight'), ...
    'DefaultTextUnits','data')
% only do grids if hold is off
if ~hold_state
% make a radial grid
    hold on;
  if nargin>=4
     minrho1=minr-(maxr-minr)/5;
     maxrho1=maxr;
     % in order to left a circle of 10mm
  else     
    maxrho1= max(rho(:));
    minrho1= min(rho(:));
  end   
      if minrho1>0 
        maxrho=maxrho1;
      elseif minrho1<=0&maxrho1>=0
       maxrho=maxrho1-minrho1;
      elseif maxrho1<0 
        maxrho=-1*minrho1;
      end
      
  hhh=plot([-maxrho -maxrho maxrho maxrho],[-maxrho maxrho maxrho -maxrho]);
  axis image;
  v = [get(cax,'xlim') get(cax,'ylim')];
  delete(hhh);
  rmax =v(4); 
  rmin =0; 
      
   if nargin>=4
      rticks=6;
  else
      
      ticks = sum(get(cax,'ytick')>=0);
      rticks = max(ticks-1,2);
      % check radial limits and ticks
      if rticks > 5   % see if we can reduce the number
         if rem(rticks,2) == 0
            rticks = rticks/2;
          elseif rem(rticks,3) == 0
             rticks = rticks/3;
          
          end
      end%if rticks
   end% end nargin==5 
   
% define a circle
    th = 0:pi/50:2*pi;
    xunit = cos(th);
    yunit = sin(th);
% now really force points on x/y axes to lie on them exactly
    inds = 1:(length(th)-1)/4:length(th);
    xunit(inds(2:2:4)) = zeros(2,1);
    yunit(inds(1:2:5)) = zeros(3,1);
% plot background if necessary
    if ~isstr(get(cax,'color')),
       patch('xdata',xunit*rmax,'ydata',yunit*rmax,'edgecolor',tc,'facecolor',get(gca,'color'));
    end%end if~isstr
% draw radial circles
c82 = cos(pi/2);
s82 = sin(pi/2);
rinc = (rmax-rmin)/rticks;
   
if minrho1>0
    
   
    
    for i=(rmin+rinc):rinc:(rmax-rinc)
        hhh = plot(xunit*i,yunit*i,ls,'color',tc,'linewidth',1);
        text((i+rinc/20)*c82,(i+rinc/20)*s82,[' ' num2str(i)],'verticalalignment','bottom')
        text((i+rinc/20),0,[' ' num2str(i)],'verticalalignment','bottom')
    end%end for
    set(hhh,'linestyle','-') % Make outer circle solid
 end%if minrho1>=0
 
 if minrho1<=0&maxrho1>=0
    
     
    for i=(rmin+rinc):rinc:(rmax-rinc)%note the other circle of note
        hhh = plot(xunit*i,yunit*i,ls,'color',tc,'linewidth',1);
        text((i+rinc/20)*c82,(i+rinc/20)*s82,[' ' num2str(i+minrho1)],'verticalalignment','bottom')
        text((i+rinc/20),0,[' ' num2str(i+minrho1)],'verticalalignment','bottom')
    end%for
    
 end%ifminrho1<=0&maxrho1>=0
 
 if maxrho1<0
    
  
 
    for i=(rmin+rinc):rinc:(rmax-rinc)
        hhh = plot(xunit*i,yunit*i,ls,'color',tc,'linewidth',1);
        text((i+rinc/20)*c82,(i+rinc/20)*s82,[' ' num2str(i+minrho1)],'verticalalignment','bottom')
        text((i+rinc/20),0,[' ' num2str(i+minrho1)],'verticalalignment','bottom')
    end%end for
    %set(hhh,'linestyle','-') % Make outer circle solid
 end%end if
 
 
% plot spokes
    th = (1:6)*2*pi/12;
    cst = cos(th); snt = sin(th);
    cs = [-cst; cst];
    sn = [-snt; snt];
    plot(rmax*cs,rmax*sn,ls,'color',tc,'linewidth',1)
% annotate spokes in degrees½Ç¶È±ê×¢
    rt = 1.11*rmax;
    for i = 1:length(th)
    
          text(rt*cst(i),rt*snt(i),int2str(i*(-30)+90),'horizontalalignment','center')
  
       
      if i == length(th)
            loc = int2str(90);
       else
            loc=i*(-30)+270;
              if(loc>180)
                loc=-360+loc;
               end 
            loc = int2str(loc);
       end%end if
        text(-rt*cst(i),-rt*snt(i),loc,'horizontalalignment','center')
    end%end for
% set view to 2-D
    view(2);
% set axis limits0.
    axis(rmax*[-1 1 -1.15 1.15]);
end% the max end of ~state-hold
% Reset defaults.
set(cax, 'DefaultTextFontAngle', fAngle , ...
    'DefaultTextFontName',   fName , ...
    'DefaultTextFontSize',   fSize, ...
    'DefaultTextFontWeight', fWeight, ...
    'DefaultTextUnits',fUnits );
 % transform data to Cartesian coordinates.
 % caculate the point of the data
 if ~hold_state 
    save temp.mat minrho1 maxrho1
    
    for ii=1:length(rho)
       
      if minrho1>0
          if rho(ii)<0
            xx(ii)=0
            yy(ii)=0
          %elseif rho(ii)>maxrho1
           %  xx(ii)=(maxrho1-minrho1)*sin(theta(ii));
            % yy(ii) = (maxrho1-minrho1)*cos(theta(ii));
     
          else   
            xx(ii) = (rho(ii))*sin(theta(ii));
            yy(ii) = (rho(ii))*cos(theta(ii));
          end% end the min if
       else
           if rho(ii)-minrho1<0
             xx(ii)=0
             yy(ii)=0
            %elseif rho(ii)>maxrho1
             %xx(ii)=(maxrho1-minrho1)*sin(theta(ii));
             %yy(ii) = (maxrho1-minrho1)*cos(theta(ii));
            else 
              xx(ii) = (rho(ii)-minrho1)*sin(theta(ii));
              yy(ii) = (rho(ii)-minrho1)*cos(theta(ii));
           end%end the min if
        end %end the bigger if
             
    end %end for    
   
 else % the second graph and so on
   load temp.mat minrho1 maxrho1
   %delete temp.mat
   
   for ii=1:length(rho)
       if minrho1>0
          if rho(ii)<0
            xx(ii)=0
            yy(ii)=0
          else
            xx(ii) = (rho(ii))*sin(theta(ii));
            yy(ii) = (rho(ii))*cos(theta(ii));
          end% end the min if
       else
           if rho(ii)-minrho1<0
             xx(ii)=0
             yy(ii)=0
           else
              xx(ii) = (rho(ii)-minrho1)*sin(theta(ii));
              yy(ii) = (rho(ii)-minrho1)*cos(theta(ii));
           end%end the min if
        end %end the bigger if
   end %end for    
end%endthe big if ~hold_state 
% plot data on top of grid% draw the line of data
if strcmp(line_style,'auto')
   q = plot(xx,yy);
   
else
    q = plot(xx,yy,line_style);
end
if nargout > 0
    hpol = q;
end
if ~hold_state
    axis image; axis off; set(cax,'NextPlot',next);
end