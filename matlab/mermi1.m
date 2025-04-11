%Başlangıç koşulları
v0 = 200; %başlangıç hızı (m/s)
theta = 45; %Atış açısı
x0=0; %Başlangıç konumu x için (m)
y0=0; %Başlangıç konumu y için (m)
g = 9.81; % yerçekimi ivmesi (m^2/s)
rho = 1.225; % Hava yoğunluğu (kg/m^3)
Cd = 0.3; %Sürtünme katsayısı
A= 0.05; %Mermi kesit alanı (m^2)
m = 0.1; %Mermi kütlesi (kg)
dt = 0.01; % zaman adımı/adım aralığı (s)
t_max = 100; %Maksimum simülasyon süresi(s)

%Euler yöntemi
theta_rad = deg2rad(theta);
vx0_euler = v0*cos(theta_rad); %başlangıç x hızı (m/s)
vy0_euler = v0*sin(theta_rad); %başlangıç y hızı (m/s)

x_euler = x0;
y_euler = y0;

vx_euler = vx0_euler;
vy_euler = vy0_euler;
t_euler = 0;
x_values_euler = [];
y_values_euler = [];
while y_euler >=0 && t_euler <=t_max
    v = sqrt(vx_euler^2 + vy_euler^2);
    ax = -0.5*rho*Cd*A*v*vx_euler/m;
    ay = -g -0.5*rho*Cd*A*v*vy_euler/m;
    vx_euler = vx_euler + ax*dt;
    vy_euler = vy_euler + ay*dt;

    x_euler = x_euler + vx_euler*dt;
    y_euler = y_euler + vy_euler*dt;
    t_euler = t_euler + dt;

    %sonuçları kaydetmek için
    x_values_euler = [x_values_euler,x_euler];
    y_values_euler = [y_values_euler,y_euler];
end
%Runge-Kutta yöntemi ile hesaplama
vx0_rk = v0* cos(theta_rad); %başlangıç x hızı
vy0_rk = v0 * cos(theta_rad);

x_rk = x0;
y_rk = y0;

vx_rk = vx0_rk;
vy_rk = vy0_rk;

t_rk = 0;
x_values_rk = [];
y_values_rk = [];

while y_rk >=0 && t_rk <=t_max
    %K1
    v = sqrt(vx_rk^2+vy_rk^2);
    ax = -0.5*rho*Cd*A*v*vx_rk/m;
    ay = -g -0.5*rho*Cd*A*v*vy_rk/m;

    k1x =vx_rk;
    k1y =vy_rk;
    k1vx = ax;
    k1vy = ay;
    %ax = -0.5*rho*Cd*A*v*(vx_rk + 0.5*dt*k1vx)/m;
    %K2
    v = sqrt((vx_rk + 0.5*dt*k1vx)^2 + (vy_rk + 0.5*dt*k1vy)^2);
    ax = -0.5*rho*Cd*A*v*(vx_rk + 0.5*dt*k1vx)/m;
    ay = -g -0.5*rho*Cd*A*v*(vy_rk + 0.5*dt*k1vy)/m;

    k2x = vx_rk + 0.5*dt*k1vx;
    k2y = vy_rk + 0.5*dt*k1vy;

    k2vx = ax;
    k2vy = ay;

    %K3
    v = sqrt((vx_rk + 0.5*dt*k2vx)^2 + (vy_rk + 0.5*dt*k2vy)^2);
    ax = -0.5*rho*Cd*A*v*(vx_rk + 0.5*dt*k2vx);
    ay = -g -0.5*rho*Cd*A*v*(vy_rk + 0.5*dt*k2vy);

    k3x = vx_rk + 0.5*dt*k2vx;
    k3y = vy_rk + 0.5*dt*k2vy;

    k3vx = ax;
    k3vy = ay;
    %K4
    v = sqrt((vx_rk + 0.5*dt*k3vx)^2 + (vy_rk + 0.5*dt*k3vy)^2);
    ax = -0.5*rho*Cd*A*v*(vx_rk + 0.5*dt*k3vx);
    ay = -g -0.5*rho*Cd*A*v*(vy_rk + 0.5*dt*k3vy);

    k4x = vx_rk + 0.5*dt*k3vx;
    k4y = vy_rk + 0.5*dt*k3vy;

    k4vx = ax;
    k4vy = ay;

    %yeni değerler hesaplanır
    x_rk = x_rk + (dt/6)*(k1x + 2*k2x + 2*k3x +k4x);
    y_rk = y_rk + (dt/6)*(k1y + 2*k2y + 2*k3y +k4y);

    vx_rk = vx_rk + (dt/6)*(k1vx + 2*k2vx + 2*k3vx +k4vx);
    vy_rk = vy_rk + (dt/6)*(k1vy + 2*k2vy + 2*k3vy +k4vy);

    t_rk = t_rk + dt;

    x_values_rk = [x_values_rk,x_rk];
    y_values_rk = [y_values_rk,y_rk];
end

%Grafikler
figure;
plot(x0,y0,'ro','MarkerSize',10,'MarkerFaceColor','r');hold on;
plot(x_values_euler,y_values_euler,'b-','DisplayName','Euler Yöntemi');
plot(x_values_rk,y_values_rk,'g-','DisplayName','Runge-Kutta Yöntemi');
xlabel('X Mesafe (m)');
ylabel('Y Meseafe (m)');

title('Mermi Hareket Simülasyonu - Euler ve RK Yöntemleri');
legend('Başlangıç Noktası','Euler Yolu','Runge-Kutta Yolu');
grid on;





















