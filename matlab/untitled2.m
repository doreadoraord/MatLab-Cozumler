%parametreler 
g = 10; % yer çekimi ivmesi (m/s^2)
v0 = 40; % yatayda veya x düzleminde;
h = 45; % yükseklik (m)
dt = 0.01; %adım aralığı
t_max = 10; %maksimum zaman

%başlangıç koşulları
t = 0;
x = 0;
y = h;
vx = v0;
vy = 0;

%Zaman ve konum vektörleri
T = [];
X = [];
Y = [];

while y>0
    t = t+dt;
    %RK4 hız ve konum hesaplama
    k1_vy = -g*dt;
    k2_vy = -g*dt;
    k3_vy = -g*dt;
    k4_vy = -g*dt;

    k1_y = vy*dt;
    k2_y = (vy + 0.5*k1_vy)*dt;
    k3_y = (vy + 0.5*k2_vy)*dt;
    k4_y = (vy + k3_vy)*dt;

    vy = vy + (1/6) * (k1_vy + 2*k2_vy + 2*k3_vy + k4_vy);
    y = y + (1/6) * (k1_y + 2*k2_y + 2*k3_y + k4_y);

    % yatay hız sabit, dolayısıyla x konumu için euler yeterli

    x = x + vx*dt;
    %Değerleri kaydet
    T=[T,t];
    X = [X,x];
    Y = [Y,y];

    %düşüş tamamlandığında döngüyü kır
    if y<=0
        break;
    end
end

% SOnuçların grafikleri
figure;
subplot(2,1,1);
plot(T,Y);
title('Cismin Yükseklik Zaman Grafiği');
xlabel('Zaman');
ylabel('Yükseklik/Dikey');

subplot(2,1,2);
plot(T,X);
title('Cismin Yatay Konum Zaman Grafiği');
xlabel('Zaman');
ylabel('Yatay Konum');

%Sonuç
fprintf('Cismin düşme süresi : %.2f saniye\n',T(end));
fprintf('Cismin yatayda aldığı mesafe : %.2f metre\n',X(end));







