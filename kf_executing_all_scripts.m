
%since the velocity and position of latitude doesn't affects the position and velocity of longitude
%kf estimation is perform seperately for both

%script that reads raw gps value and colllects speed bearing angle for
%latitude
read_csv_latitude

Nsamples=length(lat_m);

kf_working_stage_latitude
%script that performs the kalman filter operation for latitude

kf_results_to_gps_coordinates_latitude
%script that performs the conversion from meters to gps coordinates


%script that reads raw gps value and colllects speed bearing angle for
%longitude
read_csv_longitude

Nsamples=length(long_m);

kf_working_stage_longitude
%script that performs the kalman filter operation for longitude


kf_results_to_gps_coordinates_longitude
%script that performs the conversion from meters to gps coordinates

load('latitude_kf_estimates.mat')

%give me contateted verison of stuff
kf_output = horzcat(lat_results,long_results)


%plot the  kf lat long and comparing it with raw gps data lat long
starting_index =5
ending_index   =Nsamples

figure
plot(kf_output(starting_index:ending_index,1),kf_output(starting_index:ending_index,2),'ro')
hold on
plot(data(starting_index:ending_index,1),data(starting_index:ending_index,2),'bo')
legend('kalman filter estimates','raw gps')

save('kf_estimates_latlong','long_results')

%transfer the data such as the latitude longitude estimate, covariance
%estimates to a table

data_to_final_table
