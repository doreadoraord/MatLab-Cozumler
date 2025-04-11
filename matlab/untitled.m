%Parametreler
m1 = 0.02; %Merminin ağırlığı (kg)
m2 = 0.98; % Kutunun ağırlığı (tahta blok)
k = 400; %yay sabiti
v0 = 100; % merminin hızı (m/s)
h = 0.0001; % adım büyüklüğü/adım aralığı (s)
t_max = 0.5; % toplam süre (s)

%başlangıç koşulları
x0 = 0; % başlangıç konumu
v = (m1*v0)/(m1+m2); % çarpışma sonrası birleşen kütlenin hızı
% zaman vektörü
t = 0:h:t_max;
n = length(t);
% sonuç vektörleri
x = zeros(1,n);
v_vector = zeros(1,n);
%başlangıç değerleini atama
x(1) = x0;
v_vector(1) = v;

%euler yöntemi
for i = 1:n-1
    a = -(k/(m1+m2))*x(i); %ivme hesaplama (Hooke Yasası)
    v = v + h*a; % anlık hız takibi veya güncellemesi
    x(i+1) = x(i) + h*v; % konum güncelleme
    v_vector(i+1) = v; % belirlenen birim zaman hız kaydedilmesi
    if v<0 && abs(v)<0.01 % durma koşulu
        break;
    end
end

%Sonuçların grafikleştirilmesi
figure;
subplot(2,1,1);
plot(t,x);
title('Yay sıkıştırma - Konum Zaman Grafiği');
xlabel('Zaman (s)');
ylabel('Konum (m)');

subplot(2,1,2);
plot(t,v_vector);
title('Yay Sıkıştıma - Hız Zaman Grafiği');
xlabel('Zaman (s)');
ylabel('Hız (m/s)');









