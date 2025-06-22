clear; clc;
t = linspace(-1.6, 1.6, 200);  
T = 1;                        
w0 = 2*pi/T;                  

x = zeros(size(t));
for i = 1:length(t)
    t_mod = mod(t(i) + 0.5, 1) - 0.5;  
    if abs(t_mod) < 0.2
        x(i) = 1;
    else
        x(i) = 0;
    end
end

max_N = 50;
threshold = 0.05;
min_N = -1;

for N = 1:max_N
    k_vals = -N:N;
    ak = zeros(1, length(k_vals));
    
    for idx = 1:length(k_vals)
        k = k_vals(idx);
        if k == 0
            ak(idx) = 0.4;
        else
            ak(idx) = sin(0.4*pi*k)/(pi*k);
        end
    end
    x_hat = zeros(size(t));
    for idx = 1:length(k_vals)
        k = k_vals(idx);
        x_hat = x_hat + ak(idx) * exp(1j * k * w0 * t);
    end
    x_hat = real(x_hat); 
    error = mean(abs(x - x_hat));

    if error < threshold
        min_N = N;
        break;
    end
end

if min_N > 0
    fprintf('Minimum number of harmonics for <5%% error: %d\n', min_N);
else
    fprintf('No value of N <= %d produced error < 5%%.\n', max_N);
end

figure;
subplot(3,1,1);
plot(t, x, 'k', 'LineWidth', 1.5); title('Original x(t)');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,2);
plot(t, x_hat, 'b', 'LineWidth', 1.5); title('Synthesized x(t)');
xlabel('Time'); ylabel('Amplitude');

subplot(3,1,3);
plot(t, x - x_hat, 'r', 'LineWidth', 1.5); title('Error: x(t) - Synthesized');
xlabel('Time'); ylabel('Error');
