N1 = 1001;
t = linspace(0, 1, N1);
w0 = 2*pi;

x1 = sin(w0*t);
x11 = xcorr(x1, "biased");
t2 = linspace(-1, 1, length(x11));

x2 = sin(10*w0*t);
x22 = xcorr(x2, "biased");

x3 = 2*rand(1, N1) - 1;
x33 = xcorr(x3, "biased");

x4 = x1+x3;
x44 = xcorr(x4, "biased");

x5 = x1 + 2*x3;
x55 = xcorr(x5, "biased");

x6 = x1 + 10*x3;
x66 = xcorr(x6, "biased");

figure;

subplot(6,2,1); plot(t, x1); title('x1 = sin(w0*t)');
subplot(6,2,2); plot(t2, x11); title('Autocorr x11');

subplot(6,2,3); plot(t, x2); title('x2 = sin(10*w0*t)');
subplot(6,2,4); plot(t2, x22); title('Autocorr x22');

subplot(6,2,5); plot(t, x3); title('x3 = Random');
subplot(6,2,6); plot(t2, x33); title('Autocorr x33');

subplot(6,2,7); plot(t, x4); title('x4 = x1 + x3');
subplot(6,2,8); plot(t2, x44); title('Autocorr x44');

subplot(6,2,9); plot(t, x5); title('x5 = x1 + 2*x3');
subplot(6,2,10); plot(t2, x55); title('Autocorr x55');

subplot(6,2,11); plot(t, x6); title('x6 = x1 + 10*x3');
subplot(6,2,12); plot(t2, x66); title('Autocorr x66');


%The signal x1 is a clean sine wave whose autocorrelation shows a smooth, symmetric pattern, reflecting its strong periodic nature.

%x2 is a high-frequency sine wave with a faster-oscillating autocorrelation that decays more quickly, showing less correlation over time.

%x3 is a purely random signal whose autocorrelation exhibits a sharp central peak with near-zero values elsewhere, indicating no structure.

%x4 combines x1 with moderate noise, and its autocorrelation reveals some periodicity from the sine wave but is partially distorted by the noise.

%x5 contains stronger noise than x4, and its autocorrelation is more irregular, with only faint signs of the original sine wave pattern.

%x6 is dominated by heavy noise, making the signal appear random, and its autocorrelation closely resembles that of white noise with no periodic traits.