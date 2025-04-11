%GAUSS Yöntemi

% 3x3

% 3x + 2y - z  = 4
% 4x - 3y + 5z = 13
% x  + 2y + 3z = 14

%Denklem katsayılarını ve sonuçlarını içeren matrisi oluşturalım
A = [3,2,-1,4;4,-3,5,13;1,2,3,14];

% Gauss eleme yöntemi uygula
[m,n] = size(A);
for k = 1:m-1
    for i = k+1:m
        factor = A(i,k)/A(k,k);
        A(i,k:m+1) = A(i,k:m+1) - factor*A(k,k:m+1);
    end
end

%Geriye doğru yerine koyma (back substitution) ile denklemin çözümü bulunur
x = zeros(m,1);
for i = m:-1:1
    x(i) = (A(i,end) - A(i,i+1:end-1)*x(i+1:end)) / A(i,i);
end

%Sonuçlarv
fprintf('Denklemin çözümü : \n');
fprintf('x = %d\n',round(x(1)));
fprintf('y = %d\n',round(x(2)));
fprintf('z = %d\n',round(x(3)));

