function pb224(swerling)


% Exercise 2, Problem 2.24
% Henning Schei
%close all
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

r = 1e3:1e2:1e6;
Pd = 0.3:0.1:0.9;

% Finding the corresponding SNR to each Pd from 0.3:0.9
for i = 1:numel(Pd)
    SNR_dB(i) = calcSNR(Pd(i),P_fa,n);
end






% Part b)

% According to Swerling case 1, the target cross sections 
% fluctuates exponential distrubiated

% Using inverse transform samling to obtaion exponential distrubiated
% numers 


% Trying different implementations
figure;
switch swerling 
    case 'stationary'
        % Calculate required SNR for different ranges, the points where they
        % intersect will correspond to the maximum range for different Pd's

        
        SNR_req = (Pt*gain*Ae*sigma)./(power(4*pi,2) *1.38e-23 * 290*R_BW*Fn*power(r,4));
        SNR_req_dB = 10*log10(SNR_req);

        a = plot(r,SNR_req_dB,'.');
        grid on
        hold on

        xlabel 'R_{max} [meters]'
        ylabel '(S/N)_{min} [dB]'
        title 'Probability of detection as function of range[m] with constant target cross-section'



        dz = 0.1;
        i = 1;
        colors = ['r','g','c','y', 'm', 'b', 'k'];
        for j = SNR_dB,
            z = SNR_req_dB(SNR_req_dB < j + dz & SNR_req_dB > j -dz);
            if numel(z) > 1
                z = med(z);
            end
            z = find(abs(SNR_req_dB -z) < 0.001);
            line([0, 1e3+z*1e2-100], [j, j], 'Color', colors(i), 'LineWidth', 1);
            i=i+1;
    
    
        end

        legend('Required SNR', 'P_d = 0.3', 'P_d = 0.4', 'P_d = 0.5', 'P_d = 0.6', 'P_d = 0.7', 'P_d = 0.8','P_d = 0.9' );
        axis([0 8e4 1 8]);
        hold off
     
    case 'case1'
        N = numel(r); % Number of random points
        sigma = [];        
        sigma_avg=10;
        for j = 1:N
            sigma = [sigma ; exprnd(sigma_avg)];
        end
        
        SNR_req = (Pt.*gain.*Ae.*sigma')./(power(4*pi,2) .*1.38e-23 .* 290.*R_BW.*Fn.*power(r,4));
        SNR_req_dB = 10*log10(SNR_req);
        a = plot(r,SNR_req_dB);
        grid on
        hold on

        xlabel 'R_{max} [meters]'
        ylabel '(S/N)_{min} [dB]'
        title 'Probability of detection as function of range[m] with Swerling case 1 fluctuating cross section, \sigma_{avg}=10m^2'
        
        dz = 0.1;
        i = 1;
        colors = ['r','g','c','y', 'm', 'b', 'k'];
        i=1;
        for j = SNR_dB,
            z = SNR_req_dB(SNR_req_dB < j + dz & SNR_req_dB > j -dz);
            if numel(z) > 1
                z = med(z);
            end
            z = find(abs(SNR_req_dB -z) < 0.001);
            line([0, 1e3+z*1e2-100], [j, j], 'Color', colors(i), 'LineWidth', 1);
            i=i+1;
    
    
        end
        legend('Required SNR', 'P_d = 0.3', 'P_d = 0.4', 'P_d = 0.5', 'P_d = 0.6', 'P_d = 0.7', 'P_d = 0.8','P_d = 0.9' );
        axis([0 9e4 1 10]);
        hold off
        
end
