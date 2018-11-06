starting_index =5
ending_index   =starting_index + 500
ending_index   =Nsamples
figure
plot(kf_output(starting_index:ending_index,1),kf_output(starting_index:ending_index,2))
hold on
plot(data(starting_index:ending_index,1),data(starting_index:ending_index,2))