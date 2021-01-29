% lab5_initial.m

% load a demonstration file (already in the matlab code base) that
% contains a 180x360 matrix with elevations above sea level (in meters)
load topo
% Make lat/long vectors with values corresponding to the rows/columns of 
% topo which range from -89.5 to 89.5, and 0.5 to 359.5, respectively.
lat =[-89.5:89.5];
long =[0.5:359.5];

% Display the topography, with axes labelled in lat/longs
figure(1); clf;
imagesc(long,lat,topo)
set(gca,'ydir','normal');
xlabel('Longitude');
ylabel('Latitude');

% Grab a single point by clicking with the mouse and find 
% the row and column indexes corresponding to the position 
% in topo nearest to the point clicked.
[X,Y]=ginput(1);
if X>360
    X=X-360;
elseif X<0
    X=X+360;
else X=X;
end

if Y>90
    Y=90-(Y-90);
elseif Y<-90
    Y=-90+(-90-Y);
else Y=Y;
end

[~,iX]=min(abs(long-X)); %the ~ is a dummy variable indicating we ...
[~,iY]=min(abs(lat-Y));  %  ...don't need this output variable


% Draw a small black square marker at that point, and then add a label 
% beside the marker with its height, latitude, and longitude.
line(X,Y,'color','k','marker','s','linewidth',3);
text(X,Y,{['height (m)=' num2str(topo(iY,iX))],...
[' at lat ' num2str(Y) ],...
[' and long ' num2str(X) ]});

% problem when iX == 1 and iX ==360
if iX == 1 
    iXleft = 360; 
else 
    iXleft = iX -1 ; 
end 

if iX == 360
    iXright=1; 
else 
    iXright= iX + 1; 
end 

LON = long(iXright)- long(iXleft); %deg
LAT = Y;

%Input
slope = atand((topo(iY,iXright)-topo(iY,iXleft))/(LON*111e3*cosd(LAT)));

%Output
if slope>0.1
    if Y>0
        if X>0
            disp(['At '  num2str(Y) 'N,' num2str(X) 'E, Height is ' num2str(topo(iY,iX)) 'm and the slope is '   num2str(slope) ' degrees. This is West-facing.'])
        else
            disp(['At '  num2str(Y) 'N,' num2str(X) 'W, Height is ' num2str(topo(iY,iX)) 'm and the slope is '   num2str(slope) ' degrees. This is West-facing.'])
        end
    elseif Y<0
        if X>0
            disp(['At ' num2str(Y) 'S, ' num2str(X) 'E, Height is ' num2str(topo(iY,iX)) 'm and the slope is '   num2str(slope) ' degrees. This is West-facing.'])
        else
            disp(['At ' num2str(Y) 'S, ' num2str(X) 'W, Height is ' num2str(topo(iY,iX)) 'm and the slope is '   num2str(slope) ' degrees. This is West-facing.'])
        end
    end
elseif slope<-0.1
     if Y>0
        if X>180
            disp(['At ' num2str(Y) 'N, ' num2str(X) 'E, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is East-facing.'])
        else 
            disp(['At ' num2str(Y) 'N, ' num2str(X) 'W, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is East-facing.'])
        end
    elseif Y<0
        if X>180
            disp(['At ' num2str(Y) 'S, ' num2str(X) 'E, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is East-facing.'])
        else 
            disp(['At ' num2str(Y) 'S, ' num2str(X) 'W, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is East-facing.'])
        end
     end
else
    if Y>0
        if X>180
            disp(['At ' num2str(Y) 'N, ' num2str(X) 'E, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is Flat.'])
        else
            disp(['At ' num2str(Y) 'N, ' num2str(X) 'W, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is Flat.'])
        end
    elseif Y<0
        if X>180
            disp(['At ' num2str(Y) 'S, ' num2str(X) 'E, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is Flat.'])
        else
            disp(['At ' num2str(Y) 'S, ' num2str(X) 'W, Height is ' num2str(topo(iY,iX)) 'm and the slope is ' num2str(slope) ' degrees. This is Flat.'])
        end
     end
end

partner.name ='Christopher Ng';
Time_spent=06; %in hours


