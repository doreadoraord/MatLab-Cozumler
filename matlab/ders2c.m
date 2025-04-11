% 2x+3y = 8
% 5x-2y = 1
% Denklem matrisini oluştur
denklem_matrisi = [2,3;5,-2];
determinant = det(denklem_matrisi);

disp(determinant);

%Denklem matrisinin sonuc vektörünü oluşturma;
sonuc_vektoru = [8;1];
%x değerini bulma
x = det([sonuc_vektoru,denklem_matrisi(:,2)]) / determinant;
y = det([denklem_matrisi(:,1),sonuc_vektoru]) / determinant;

disp('Denklemin Çözümü : ');
disp(['x = ',num2str(x)]);
disp(['y = ',num2str(y)]);