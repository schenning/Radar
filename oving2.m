% Oving 2, Problem 2.24
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
fn = 1;
SNR_req = zeros(1,numel(1e5:1e5:1e6));



% Calculate reqired SNR for different ranges
for range =1e5:1e5:1e6
    SNR_req(range) = (Pt*gain*Ae*sigma)/((4*pi)^2 * 290* 1.3e-23*fn*range^4);
end

%plot(1:1000, SNR_req);




    





cross_section_target = 10; %m**2

Pd = 0.3:0.1:0.99;
SNR_dB = zeros(1,numel(Pd));
for i = 1:numel(Pd)
    SNR_dB(i) = calcSNR(Pd(i),P_fa,n); 
end

for i=1:numel(Pd)
    SNR(i) = 10^(SNR_dB(i)/10);
end

    

plot(10*log10(SNR_req));
grid on;
hold on;








