%parametreler
m1 = 0.02; % merminin kütlesi - kg
m2 = 0.98; % tahtanı kütlesi - kg
k = 400; % yay sabiti (N/m)
v0 = 100; % m/s
h = 0.0001; % adım büyüklüğü (s)
t_max = 0.5;

%başlangıç koşulları 
x0 = 0; % başlangıç konumu
v = (m1*v0)/(m1+m2); % çarpışma sonrası kütlenin hızı
% zaman vektörü
t = 0:h:t_max;
n = length(t);

%Sonuç vektörleri
x = zeros(1,n);
v_vector = zeros(1,n);

%Başlangıç değerlerini atama
x(1) = x0;
v_vector(1) = v;
%Euler yöntemi
for i = 1:n-1
    a = -(k/(m1+m2)) * x(i);%ivme hesaplama(Hooke yasası)
    v = v+h*a; % hız güncellemesi
    x(i+1) = x(i) + h*v; %konum günc
    v_vector(i+1) = v; % hız kaydı
    if v<0 && abs(v)<0.01 % durma koşulu
        break;
    end
end

%Sonuçların grafikleri
figure;
subplot(2,1,1);
plot(t,x);
title('Yay sıkıştırma - Konum Grafiği');
xlabel('Zaman (s)');
ylabel('Konum (m)');

subplot(2,1,2);
plot(t,v_vector);
title('Yay Sıkıştırma - Hız Grafiği');
xlabel('Zaman (s)');
ylabel('Hız (m/s)');














