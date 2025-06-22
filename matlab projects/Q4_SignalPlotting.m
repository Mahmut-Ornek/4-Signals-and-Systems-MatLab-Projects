t = -127:128;
A1 = 3; C = 10;
x1 = A1 * exp(-abs(t)/C);

A2=12; w0 = 2*pi/16;
x2 = A2 * sin(w0*t) ./t;
x2(t == 0) = A2*w0;

x1FT = fftshift(fft(x1));
x2FT = fftshift(fft(x2));

x3 = x1 + x2;
x3FT = fftshift(fft(x3));
x12FTsum = x1FT + x2FT;
x12FTdif = x3FT - x12FTsum;

figure;

subplot(7,2,1); plot(t, x1); title('x1');
subplot(7,2,2); plot(angle(x1FT)); title('Phase of x1FT');
subplot(7,2,3); plot(t, x2); title('x2');
subplot(7,2,4); plot(angle(x2FT)); title('Phase of x2FT');
subplot(7,2,5); plot(abs(x1FT)); title('|x1FT|');
subplot(7,2,6); plot(abs(x2FT)); title('|x2FT|');
subplot(7,2,7); plot(real(x1FT)); title('Real(x1FT)');
subplot(7,2,8); plot(real(x2FT)); title('Real(x2FT)');
subplot(7,2,9); plot(imag(x1FT)); title('Imag(x1FT)');
subplot(7,2,10); plot(imag(x2FT)); title('Imag(x2FT)');
subplot(7,2,11); plot(abs(x3FT)); title('|x3FT|');
subplot(7,2,12); plot(abs(x12FTsum)); title('|x12FTsum|');
subplot(7,2,13); plot(abs(x12FTdif)); title('|x12FTdif|');
subplot(7,2,14); plot(angle(x12FTdif)); title('Phase of x12FTdif');