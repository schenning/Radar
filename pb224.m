
close all;
clear all;
sigma = rand(1000,1);
sigma_avg = 10; 

% According to Swerling case 1, the target cross sections 
% fluctuates exponential distrubiated

% Using inverse transform samling to obtaion exponential distrubiated
% numers 




%sigma_exp =  -log(sigma/power(sigma_avg,1));
%hist(sigma_exp,100)

R = exprnd(sigma);

sum(R)

hist(R,1000);


x = 1/sigma_avg * exp(-linspace(0,50,50)./sigma_avg);
figure;
plot(linspace(0,1,50),x);
