clear
data=csvread('loccsv.csv')
Zk  =zeros(2,length(data));

% for i=1:length(data)
% lat_m(i)  = latitudetometer(data(i,1))
% long_m(i) = longitudetometer(data(i,2))
% 
% end
lat_m=latitudetometer(data(:,1))
long_m=longitudetometer(data(:,2))

Zk(1,:)=long_m
%get the velocity component along latitude
v_long  =data(:,4).*cos(deg2rad(data(:,5)))
% measurement vector
Zk(2,:)=v_long


accuracy=data(:,3)



