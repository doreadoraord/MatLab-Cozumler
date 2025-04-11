%Parametereler
g = 10;
v= 40;
h = 45;
dt = 0.01; %adım aralığı (h)
t_max = 10;
% başlangıç koşulları
t = 0;
x = 0;
y = h;
vx = v0; % yatay hız
vy = 0; % dikey hız

%Zaman ve konum vektörleri
T = [];
X = [];
Y = [];

while y>0
    %zamanı güncellemek gerek
    t = t+dt;
    %RK4
    k1_vy = -g*dt;
    k2_vy = -g*dt;
    k3_vy = -g*dt;
    k4_vy = -g*dt;

    k1_y = vy*dt;
    k2_y = (vy+0.5*k1_vy) * dt;
    k3_y = (vy+0.5*k2_vy) * dt;
    k4_y = (vy+k3_vy) * dt;

    vy = vy + (1/6)*(k1_vy+2*k2_vy+2*k3_vy+k4_vy);
    y = y + (1/6)*(k1_y + 2*k2_y+2*k3_y+k4_y);

    %yatay hız sabit, dolayısıyla x konumu için sadece euler yeterli
    x = x+vx*dt;
    %değerleri kaydet
    T = [T,t];
    X = [X,x];
    Y = [Y,y];
    %düşüş tamamlandığında döngüyü kır
    if y<=0
        break;
    end
end








