% 3x3 boyutunda bir matris oluşturma.
matris = [1,2,3;0,1,4;5,6,0];
%matrisi ekrana yazdırma
disp('Matris');
disp(matris);

%Matrisin tersini alma
ters_matris = inv(matris);
%Sonucu ekrana yazdırma
disp('Matrisin Tersi');
disp(ters_matris);