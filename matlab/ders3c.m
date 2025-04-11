% Örnek bir matris yaz
matris = [5,2,9;7,1,4;3,8,6];
%Matrisi ekrana yazdır
disp('Matris : ');
disp(matris);

%Matrisin elemanlarını küçükten büyüğe sıralama
sirali_matris = sort(matris(:));
%Matrisin elemanlarını toplama
toplam = sum(sirali_matris);
%Matrisin diagonal elemanları
kosegen = diag(matris);
iz = (trace(matris));


disp('Sıralı Matris : ');
disp(sirali_matris);

disp(toplam);
disp(kosegen);
disp(iz);
