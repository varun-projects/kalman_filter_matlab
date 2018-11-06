



velocity_lat_results =transpose(velocity_lat_results)
velocity_long_results=transpose(velocity_long_results)
P_loc_buffer_lat     =transpose(P_loc_buffer_lat)
P_loc_buffer_long    =transpose(P_loc_buffer_long)
loc_estimation       =horzcat(data(2:Nsamples,1),data(2:Nsamples,2),data(2:Nsamples,3),data(2:Nsamples,4),data(2:Nsamples,5),lat_results(3:Nsamples+1),long_results(3:Nsamples+1),velocity_lat_results(3:Nsamples+1),velocity_long_results(3:Nsamples+1),P_loc_buffer_lat(3:Nsamples+1),P_loc_buffer_long(3:Nsamples+1))

%%% storing and getting the covariance as well
latitude=loc_estimation(:,1)
longitude=loc_estimation(:,2)
acccuracy=loc_estimation(:,3)
speed= loc_estimation(:,4)
bearing= loc_estimation(:,5)

kf_latitude=loc_estimation(:,6)
kf_longitude=loc_estimation(:,7)
kf_speed_lat=loc_estimation(:,8)
kf_speed_long=loc_estimation(:,9)

kf_speed_total=sqrt(loc_estimation(:,8).*loc_estimation(:,8) +loc_estimation(:,9).*loc_estimation(:,9))

kf_covariance_lat=loc_estimation(:,10)
kf_covariance_long=loc_estimation(:,11)


%time_in_sec=transpose(time_in_sec)
loc_estimation=horzcat(loc_estimation,kf_speed_total)

loc_uncertinity_table = array2table(loc_estimation,'VariableNames',{'latitude','longitude','accuracy','speed','bearing','kf_latitude','kf_longitude','kf_speed_lat','kf_speed_long','kf_covariance_lat' ,'kf_covariance_long','kf_speed_total'})

%data_table = array2table(loc_uncertinity_table)
writetable(loc_uncertinity_table,'loc_uncertinity_cloumn_table.csv');
