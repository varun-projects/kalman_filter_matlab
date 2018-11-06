%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kalman filter 

Xk_prev= Zk(:,1)


% phi is prediction model A

dt =1
Phi = [1 dt;
       0  1];


% P is intitalized 
P = [1 0;0 1];

% Q is the process noise covariance. It represents the amount of
% uncertainty in the prediction model. In our case the acceleration
% uncertinity due to acceleration in added

%https://pdfs.semanticscholar.org/0b93/eb84ff2f48ea8d9e2770e4b45d30609095b1.pdf

accdev=0.0625

Q = [accdev/4 accdev/3;
     accdev/2 accdev];

 

% M is the measurement matrix. 
M =[1 0;0 1];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Kalman iteration %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Current state estimate
Xk=[];

% Buffers for later display
Xk_buffer = zeros(2,Nsamples);

%%% Z  is the measurement vector 

for k=2:Nsamples
    
    std_pos =accuracy(k)
    var_pos =accuracy(k)
    %*accuracy(k)
    
    R=[var_pos 0;0 9]
    Z=Zk(:,k)
    
    % Kalman iteration
    P1 = Phi*P*Phi' + Q;
    S = M*P1*M' + R;
    
    % K is Kalman gain. 
    K = P1*M'*inv(S);
    P = P1 - K*M*P1;
    
    Xk = Phi*Xk_prev + K*(Z-M*Phi*Xk_prev);
    Xk_buffer(:,k+1) = Xk;
    P_loc_buffer_lat(k+1)=P(1,1)
    
    % For the next iteration
    Xk_prev = Xk; 
    
end


% close all
% figure
% plot(Xk_buffer(1,100:Nsamples))
% hold on
% plot(lat_m(100:Nsamples))



