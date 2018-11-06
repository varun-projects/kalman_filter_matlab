%%%plots to check if kf is working or not
f=figure
title('kf comparison with raw gps')
start_index=90
end_index=start_index+100
plot(pppkf_results2(start_index:end_index,1),pppkf_results2(start_index:end_index,2));
hold on
plot(data(start_index:end_index,1),data(start_index:end_index,2),'r');
legend('KF','raw')

saveas(f,'kf_plot_data_batch9.png')  % here you save the figure

starting_index =5
ending_index   =starting_index + 300
ending_index   =Nsamples
figure
plot(kf_output(starting_index:ending_index,1),kf_output(starting_index:ending_index,2))
hold on
plot(data(starting_index:ending_index,1),data(starting_index:ending_index,2))
