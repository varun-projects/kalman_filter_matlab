
buffer_data = table2array(accelerationreguler11052018);
%or with respect to the

[my_loc_data_set, ia, iic] = unique(buffer_data(:,10:14),'rows','stable'); 

% sum up and take the average of all the dataset with respect to unique


data_table=array2table(my_loc_data_set);
writetable(data_table,'loccsv.csv');