clear; clc;

x = linspace(0, 2*pi , 1000);

y1 = x .* exp(-x);
y2 = exp(cos(x));

figure;
plot(x, y1, "r", "LineWidth",1.5);
hold on;
plot(x, y2, "b","LineWidth",1.50);
title("Plot of x*exp(-x) and exp(cos(x))");
xlabel("x (radians)");
ylabel("Function Value");
legend("x * exp(-x)", "exp(cos(x))");
grid on;

figure;

subplot(2,1,1);
plot(x, y1, "r", "LineWidth",1.5);
title("y = x * exp(-x)");
xlabel("x (radians)");
ylabel("Amplitude");
grid on;

subplot(2,1,2);
plot(x, y2, "b","LineWidth",1.50);
title("y = exp(cos(x))");
xlabel("x (radians)");
ylabel("Amplitude");
grid on;