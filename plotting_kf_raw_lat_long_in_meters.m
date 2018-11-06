figure
%plot(lat_m,long_m)
%hold on 
starting_index =10
ending_index   =20
%ending_index   =starting_index + 500
%ending_index   =Nsamples
plot(lat_m(starting_index:ending_index),long_m(starting_index:ending_index),'r*')
hold on
plot(lat_meters(starting_index:ending_index),long_meters(starting_index:ending_index),'b*')