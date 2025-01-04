%% input time and frequency response 
[data,fs] = audioread("audioname.wav");
N = length(data);
t=(0 : N-1)/fs; 
w = 0 : 2*pi/N : 2*pi-2*pi/N;
figure,plot(t,data),ylim([-0.4 0.4])
xlabel('t (s)'), ylabel('Amplitude (V)'),grid on, title('Time Domain Representation of the Input')
%freq
f = linspace(0,48000,N);
fft_input = fft(data);
figure,plot((w(1:N/2))/pi,abs(fft_input(1:N/2))),grid on,ylabel('Magnitude'),...
xlabel('Frequency(\times\pi)'), title('Frequency Domain Representation of the Input')
figure,plot(f(1:N/2),abs(fft_input(1:N/2))),grid on,ylabel('Magnitude'),...
xlabel('Frequency (Hz)'), title('Frequency Domain Magnitude Representation of the Input')
figure,plot((w(1:N/2))/pi,180*angle(fft_input(1:N/2))/pi),grid on,ylabel('Phase (degrees)'),...
xlabel('Frequency(\times\pi)'),title('Frequency Domain Phase Representation of the Input')
%soundsc(data,fs)
figure,specgram(data),colorbar,title('Specgram Representation of Input')
%% inverse function 
num = [1 -1 0.89];
den = [1 0 -0.9025];
%inverse is changing the num and den of function
[H,W]=freqz(den,num);
figure,freqz(den,num)
%% inverse function implementation
inversed_data = filtfilt(den,num,data);
figure,plot(t,inversed_data), xlabel('t (s)'), ylabel('Amplitude (V)'),grid on, title('Time Domain Representation of the Undistorted Input')
%soundsc(inversed_data,48000)
fft_inversed = fft(inversed_data);
figure,plot((w(1:N/2))/pi,20*log10(abs(fft_inversed(1:N/2)))),grid on,ylabel('Magnitude (dB)'),...
xlabel('Frequency(\times\pi)'), title('Frequency Domain Representation of the Undistorted Input')
figure,plot(f(1:N/2),abs(fft_inversed(1:N/2))),grid on,ylabel('Magnitude'),xlabel('Frequency (Hz)'),...
title('Frequency Domain Magnitude Representation of the Undistorted Input')
figure,plot((w(1:N/2))/pi,180*angle(fft_inversed((1:N/2)))/pi),grid on,ylabel('Phase (degrees)'),...
xlabel('Frequency(\times\pi)'),title('Frequency Domain Phase Representation of the Undistorted Input')
figure,specgram(inversed_data),colorbar,title('Specgram Representation of Undistorted Input')
%% notch filter
num_filt=[1 -2*cos(pi/4) 1];
den_filt=[1 -1.9*cos(pi/4) 0.9025];
figure,freqz(num_filt,den_filt)
%% output filtering
output = filtfilt(num_filt, den_filt, inversed_data);
figure,plot(t,output),xlabel('t (s)'), ylabel('Amplitude (V)'),grid on, title('Time Domain Representation of the Output')
fft_output = fft(output);
figure,plot((w(1:N/2))/pi,20*log10(abs(fft_output(1:N/2)))),grid on,ylabel('Magnitude (dB)'),...
xlabel('Frequency(\times\pi)'), title('Frequency Domain Representation of the Output')
figure,plot(f(1:N/2),abs(fft_output(1:N/2))),grid on,ylabel('Magnitude'),xlabel('Frequency (Hz)'),...
title('Frequency Domain Magnitude Representation of the Output')
figure,plot((w(1:N/2))/pi,180*angle(fft_output(1:N/2))/pi),grid on,ylabel('Phase (degrees)'),...
xlabel('Frequency(\times\pi)'),title('Frequency Domain Phase Representation of the Output')
soundsc(output,fs)
figure,specgram(output),colorbar,title('Specgram Representation of Output')
audiowrite('output_signal.wav', output, fs);
