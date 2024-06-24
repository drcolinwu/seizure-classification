function [out] = findbp(in)
    fs = 500; % 采样频率
    nfft = 1024; % FFT的点数

    % 计算PSD
    [p,f] = pwelch(in, hanning(nfft), nfft/2, nfft, fs);

    % 计算特定频带的功率
    power1_delta = bandpower(p, f, [0.1, 4], 'psd');
    power1_theta = bandpower(p, f, [4, 8], 'psd');
    power1_alpha = bandpower(p, f, [8, 13], 'psd');
    power1_beta = bandpower(p, f, [13, 30], 'psd');
    out = [power1_delta; power1_theta; power1_alpha; power1_beta];
end