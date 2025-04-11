%Düzgün bir matis oluşturalım
matris = [3,1,2;0,1,4;5,6,0];

% Matrisi yazdır
disp('Matris : ');
disp(matris);

%Matrisin tersini bulma
ters_matris = inv(matris);
%Ters matrisi ekrana yazdırma
disp('Matrisin tersi : ');
disp(ters_matris);

%Matris ile ters matrisin çarpımını bulma
carpim_sonucu = matris * ters_matris;
%çarpım sonucu yazdır
disp('Matris ile ters matrisin çarpımı');
disp(carpim_sonucu);


