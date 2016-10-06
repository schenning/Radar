% Exercise 2, Problem 2.24
% Henning Schei
close all
f = 9400e6;

% Antenna properties:

verticalBeamWith = .8; % degrees
gain_dB             = 33; % dB
gain = 10^(gain_dB/10);
azimuth_rotation_rate = 20; %rpm



Pt   = 25e3;
ppr  = 4000;
R_nf = 5; %dB
R_BW = 15e6; %Hz
system_loss = 12; %dB
T_fa = 4*60*60; %seconds
P_fa = 1/(T_fa*R_BW);
sigma = 10;
n=26;
Ae = 1;
Fn_dB = 5;
Fn = 10^(Fn_dB/10);






Pd = 0.3:0.1:0.99;
for i = 1:numel(Pd)
    SNR_dB(i) = calcSNR(Pd(i),P_fa,n);
end



% Calculate reqired SNR for different ranges
i=1;
r = 1e3:1e2:1e6;
SNR_req = (Pt*gain*Ae*sigma)./(power(4*pi,2) *1.38e-23 * 290*R_BW*Fn*power(r,4));
SNR_req_dB = 10*log10(SNR_req);


a = plot(r,SNR_req_dB);
grid on

%ylabel 'Probability of detection'
xlabel 'R_{max} [meters]'

ylabel '(S/N)_{min} [dB]'














dz = 0.1;
i = 1;
colors = ['r','g','c','y', 'm'];
for j = SNR_dB,
    
    
    
    
    z = SNR_req_dB(SNR_req_dB < j + dz & SNR_req_dB > j -dz);
    
    
    
    if numel(z) > 1
        z = median(z);
        disp('hei')
    end
    
    z = find(abs(SNR_req_dB -z) < 0.001);
    
    
    
    
    line([0, 1e3+z*1e2-100], [j, j], 'Color', colors(i), 'LineWidth', 1);
    legend('Required SNR', 'P_d = 0.3', 'P_d = 0.4', 'P_d = 0.5', 'P_d = 0.6', 'P_d = 0.7' );
    
    1e3 + z*1e2
    i=i+1;
    
end


axis([4.4e4 4.65e4 5.4 6.7]);





% Part C)
% I assume the the average cross-section is around 10m^2

sigma = 10*rand(1000,1) +5;
sigma_avg = mean(sigma);

% According to Swerling case 1, the target cross-sections 
% fluctuates with an exponential distribution

sigma  = exprnd(sigma);



SNR_req = (Pt*gain*Ae*sigma)./(power(4*pi,2) *1.38e-23 * 290*R_BW*Fn*power(r,4));
SNR_req_dB = 10*log10(SNR_req);







