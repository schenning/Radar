function SNR = calcSNR(Pd, Pfa, n)
    % n   - number of hits/scan
    % Pd  - prob of detection
    % Pfa - prob of false alarm
    A = log(.62/Pfa); B = log(Pd/(1-Pd));
    SNR = -5*log10(n) + (6.2 + 4.54/(sqrt(n+.44)))*log10(A + .12*A*B + 1.7*B);% SOme error here
   
end



