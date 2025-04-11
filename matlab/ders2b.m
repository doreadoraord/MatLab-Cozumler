% 4x4 boyutunda bir matris oluşturma
matris = [1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16];
disp(matris);
%Matrisin boyutunu alma
[rows,cols] = size(matris);
disp(['Matrisin boyutu: ',num2str(rows),'x',num2str(cols)]);

%Matrisin toplam eleman sayısı
toplam_eleman_sayisi = numel(matris);
disp(toplam_eleman_sayisi);

%Matrisin belirli bir satırını veya sütununu değiştirme
matris(2,:) = [10,20,30,40]; %2. satırı değiştirme
matris(:,3) = [100;200;300;400;]; % 3. sütunu değiştirme

disp(matris);
%Matrisin belirli bir satırını veya sütununu alma
secilen_satir = matris(3,:);
disp(secilen_satir);
%Matrisin belirli bir bölgesini alma
bolge = matris(1:2,3:4); % 1. ve 2. satırlar, 3. ve 4. sütunlar
disp(bolge);

disp(matris);
matris(1,1) = 1234;
disp(matris);