
% Set true trajectory 
dt = 1;
t=0:dt:dt*Nsamples;



Xk_prev= Zk(:,1)


% Current state estimate
Xk=[];


dt =1
Phi = [1 dt;
       0  1];

% The error matrix (or the confidence matrix): P 

% P = sigma^2*G*G';
P = [1 0; 0 1];
             
% Q is the process noise covariance. 

accdev=0.0625
Q = [accdev/4 accdev/3;
     accdev/2 accdev];

% M is the measurement matrix. 


M =[1 0;0 1];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Kalman iteration %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Buffers for later display
Xk_buffer = zeros(2,Nsamples);



%%% Z  is the measurement vector 




for k=1:Nsamples
    
    % Z is the measurement vector.
    
    std_pos =accuracy(k)
    var_pos =accuracy(k)*accuracy(k)
    %*accuracy(k)
    
    R=[var_pos 0;0 9]

    Z=Zk(:,k)
    
    
    % Kalman iteration
    P1 = Phi*P*Phi' + Q;
    S = M*P1*M' + R;
    
    % K is Kalman gain. If K is large, more weight goes to the measurement.
    % If K is low, more weight goes to the model prediction.
    K = P1*M'*inv(S);
    P = P1 - K*M*P1;
    
    Xk = Phi*Xk_prev + K*(Z-M*Phi*Xk_prev);
    Xk_buffer(:,k+1) = Xk;
    
    P_loc_buffer_long(k+1)=P(1,1)

    % For the next iteration
    Xk_prev = Xk; 
    
end


% close all
% figure
% plot(Xk_buffer(1,100:Nsamples))
% hold on
% plot(long_m(100:Nsamples))


