% CRAMER METODU

% 2x + 3y - z = 10
% 4x - 2y + 5z = 4
% x  +  y + 3z = 6

%Denklem katsayılarını ve sonuçları içeren matisi oluşturalım.
A = [2,3,-1;4,-2,5;1,1,3];
B = [10;4;6];

%Denklemin çözümünü cramer metodu ile hesaplayalım.
x = det([B,A(:,2:3)]) / det(A);
y = det([A(:,1),B,A(:,3)]) / det(A);
z = det([A(:,1:2),B]) /det(A);

%Sonuçlar
fprintf('Denklemin Çözümü: \n');
fprintf('x = %.2f\n',x);
fprintf('y = %.2f\n',y);
fprintf('z = %.2f\n',z);
